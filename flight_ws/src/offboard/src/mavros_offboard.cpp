#include <ros/ros.h>
#include <geometry_msgs/PoseStamped.h>
#include <mavros_msgs/CommandBool.h>
#include <mavros_msgs/SetMode.h>
#include <mavros_msgs/State.h>
#include <gazebo_msgs/ModelState.h>
#include <nav_msgs/Odometry.h>

using namespace std;
mavros_msgs::State current_state;
geometry_msgs::PoseStamped vis_pose;

void state_cb(const mavros_msgs::State::ConstPtr& msg){
    current_state = *msg;
}

void update_pose(const nav_msgs::Odometry::ConstPtr& msg){
    vis_pose.pose = msg->pose.pose;
    vis_pose.header.stamp = ros::Time::now(); 
   vis_pose.header.frame_id = "map";
    // base_link << msg->pose.position.x << endl;
    ROS_INFO_STREAM("vis_pose_callback" << vis_pose);
    // ROS_INFO_STREAM(*msg);
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "offb_node");

    ros::NodeHandle nh;

    ros::Subscriber state_sub = nh.subscribe<mavros_msgs::State>
            ("mavros/state", 10, state_cb);
    ros::Publisher local_pos_pub = nh.advertise<geometry_msgs::PoseStamped>
            ("mavros/setpoint_position/local", 10);
    ros::ServiceClient arming_client = nh.serviceClient<mavros_msgs::CommandBool>
            ("mavros/cmd/arming");
    ros::ServiceClient set_mode_client = nh.serviceClient<mavros_msgs::SetMode>
            ("mavros/set_mode");
    ros::Publisher vis_pos_pub = nh.advertise<geometry_msgs::PoseStamped>
            ("mavros/mocap/pose", 10);
    ros::Subscriber gaz_pos = nh.subscribe<nav_msgs::Odometry>
        ("ground_truth/state", 10, update_pose);


    //the setpoint publishing rate MUST be faster than 2Hz
    ros::Rate rate(2);

    // wait for FCU connection
    while(ros::ok() && !current_state.connected){
        ros::spinOnce();
        rate.sleep();
    }

    geometry_msgs::PoseStamped set_pose;

    //send a few setpoints before starting

    mavros_msgs::SetMode offb_set_mode;
    offb_set_mode.request.custom_mode = "OFFBOARD";

    mavros_msgs::CommandBool arm_cmd;
    arm_cmd.request.value = true;

    ros::Time last_request = ros::Time::now();
    int i = 0;
    while(ros::ok() && i < 100){
        if( current_state.mode != "OFFBOARD" &&
            (ros::Time::now() - last_request > ros::Duration(5.0))){
            if( set_mode_client.call(offb_set_mode) &&
                offb_set_mode.response.mode_sent){
                ROS_INFO("Offboard enabled");

            }
            last_request = ros::Time::now();
        } else {
            if( !current_state.armed &&
                (ros::Time::now() - last_request > ros::Duration(5.0))){
                if( arming_client.call(arm_cmd) &&
                    arm_cmd.response.success){
                    ROS_INFO("Vehicle armed");
                }
                last_request = ros::Time::now();
            }
        }
        
        vis_pos_pub.publish(vis_pose);

        if( current_state.mode == "OFFBOARD" && current_state.armed){
            set_pose.pose.position.x = 0;
            set_pose.pose.position.y = 5;
            set_pose.pose.position.z = 2;
            // ROS_INFO_STREAM(set_pose); 
            local_pos_pub.publish(set_pose);
            i++;
        } else {            
            set_pose.pose.position.x = 0;
            set_pose.pose.position.y = 0;
            set_pose.pose.position.z = 0;
            ROS_INFO_STREAM(set_pose);  
            local_pos_pub.publish(set_pose);   
        }
        ros::spinOnce();
        rate.sleep();
    }

    return 0;
}