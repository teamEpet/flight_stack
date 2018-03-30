# Copyright 2016 Proyectos y Sistemas de Mantenimiento SL (eProsima).
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

ACLOCAL_AMFLAGS = -I m4 --install

lib_LTLIBRARIES = libfastrtps.la
libfastrtps_la_SOURCES =  log/Log.cpp log/StdoutConsumer.cpp utils/eClock.cpp utils/IPFinder.cpp utils/md5.cpp utils/StringMatching.cpp rtps/resources/ResourceEvent.cpp rtps/resources/TimedEvent.cpp rtps/resources/TimedEventImpl.cpp rtps/resources/AsyncWriterThread.cpp rtps/resources/AsyncInterestTree.cpp rtps/Endpoint.cpp rtps/writer/RTPSWriter.cpp rtps/writer/StatefulWriter.cpp rtps/writer/ReaderProxy.cpp rtps/writer/StatelessWriter.cpp rtps/writer/ReaderLocator.cpp rtps/writer/timedevent/InitialHeartbeat.cpp rtps/writer/timedevent/PeriodicHeartbeat.cpp rtps/writer/timedevent/NackResponseDelay.cpp rtps/writer/timedevent/NackSupressionDuration.cpp rtps/history/CacheChangePool.cpp rtps/history/History.cpp rtps/history/WriterHistory.cpp rtps/history/ReaderHistory.cpp rtps/reader/timedevent/HeartbeatResponseDelay.cpp rtps/reader/timedevent/WriterProxyLiveliness.cpp rtps/reader/timedevent/InitialAckNack.cpp rtps/reader/CompoundReaderListener.cpp rtps/reader/WriterProxy.cpp rtps/reader/StatefulReader.cpp rtps/reader/StatelessReader.cpp rtps/reader/RTPSReader.cpp rtps/reader/FragmentedChangePitStop.cpp rtps/messages/CDRMessagePool.cpp rtps/messages/RTPSMessageCreator.cpp rtps/messages/RTPSMessageGroup.cpp rtps/messages/MessageReceiver.cpp rtps/messages/submessages/AckNackMsg.hpp rtps/messages/submessages/DataMsg.hpp rtps/messages/submessages/GapMsg.hpp rtps/messages/submessages/HeartbeatMsg.hpp rtps/network/NetworkFactory.cpp rtps/network/SenderResource.cpp rtps/network/ReceiverResource.cpp rtps/participant/RTPSParticipant.cpp rtps/participant/RTPSParticipantImpl.cpp rtps/RTPSDomain.cpp Domain.cpp participant/Participant.cpp participant/ParticipantImpl.cpp publisher/Publisher.cpp publisher/PublisherImpl.cpp publisher/PublisherHistory.cpp subscriber/Subscriber.cpp subscriber/SubscriberImpl.cpp subscriber/SubscriberHistory.cpp transport/UDPv4Transport.cpp transport/UDPv6Transport.cpp transport/test_UDPv4Transport.cpp qos/ParameterList.cpp qos/ParameterTypes.cpp qos/QosList.cpp qos/QosPolicies.cpp qos/WriterQos.cpp qos/ReaderQos.cpp rtps/builtin/BuiltinProtocols.cpp rtps/builtin/discovery/participant/PDPSimple.cpp rtps/builtin/discovery/participant/PDPSimpleListener.cpp rtps/builtin/discovery/participant/timedevent/RemoteParticipantLeaseDuration.cpp rtps/builtin/discovery/participant/timedevent/ResendParticipantProxyDataPeriod.cpp rtps/builtin/discovery/endpoint/EDP.cpp rtps/builtin/discovery/endpoint/EDPSimple.cpp rtps/builtin/discovery/endpoint/EDPSimpleListeners.cpp rtps/builtin/discovery/endpoint/EDPStatic.cpp rtps/builtin/liveliness/WLP.cpp rtps/builtin/liveliness/WLPListener.cpp rtps/builtin/liveliness/timedevent/WLivelinessPeriodicAssertion.cpp rtps/builtin/data/ParticipantProxyData.cpp rtps/builtin/data/WriterProxyData.cpp rtps/builtin/data/ReaderProxyData.cpp rtps/flowcontrol/ThroughputController.cpp rtps/flowcontrol/ThroughputControllerDescriptor.cpp rtps/flowcontrol/FlowController.cpp rtps/exceptions/Exception.cpp rtps/attributes/PropertyPolicy.cpp rtps/common/Token.cpp xmlparser/XMLParserCommon.cpp xmlparser/XMLProfileElementParser.cpp xmlparser/XMLEndpointParser.cpp xmlparser/XMLProfileParser.cpp 
 
if SECURITY 
libfastrtps_la_SOURCES +=  rtps/security/exceptions/SecurityException.cpp rtps/security/common/SharedSecretHandle.cpp rtps/security/SecurityManager.cpp rtps/security/SecurityPluginFactory.cpp rtps/security/timedevent/HandshakeMessageTokenResent.cpp security/OpenSSLInit.cpp security/authentication/PKIDH.cpp security/cryptography/AESGCMGMAC.cpp security/cryptography/AESGCMGMAC_KeyExchange.cpp security/cryptography/AESGCMGMAC_KeyFactory.cpp security/cryptography/AESGCMGMAC_Transform.cpp security/cryptography/AESGCMGMAC_Types.cpp security/authentication/PKIIdentityHandle.cpp security/access/mockAccessHandle.cpp security/authentication/PKIHandshakeHandle.cpp 
endif
 
libfastrtps_la_SOURCES +=  ../../thirdparty/tinyxml2/tinyxml2.cpp
libfastrtps_la_LDFLAGS = -version-number 1:5:0 -lpthread

AM_CPPFLAGS = -DFASTRTPS_SOURCE -DBOOST_ASIO_STANDALONE -DASIO_STANDALONE -I../../include -I../../thirdparty/tinyxml2 -I../../thirdparty/asio

if SECURITY
AM_CPPFLAGS += $(OPENSSL_INCLUDES)
libfastrtps_la_LDFLAGS += $(OPENSSL_LDFLAGS) $(OPENSSL_LIBS)
endif
