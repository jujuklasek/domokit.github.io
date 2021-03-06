// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library test_request_tracker.mojom;

import 'dart:async';

import 'package:mojo/public/dart/bindings.dart' as bindings;
import 'package:mojo/public/dart/core.dart' as core;


class ServiceStats extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  int numNewRequests = 0;
  double health = 0.0;

  ServiceStats() : super(kVersions.last.size);

  static ServiceStats deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ServiceStats decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ServiceStats result = new ServiceStats();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size != kVersions[i].size)
            throw new bindings.MojoCodecError(
                'Header doesn\'t correspond to any known version.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      result.numNewRequests = decoder0.decodeUint64(8);
    }
    if (mainDataHeader.version >= 0) {
      
      result.health = decoder0.decodeDouble(16);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeUint64(numNewRequests, 8);
    
    encoder0.encodeDouble(health, 16);
  }

  String toString() {
    return "ServiceStats("
           "numNewRequests: $numNewRequests" ", "
           "health: $health" ")";
  }
}

class ServiceReport extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(32, 0)
  ];
  String serviceName = null;
  int totalRequests = 0;
  double meanHealth = 0.0;

  ServiceReport() : super(kVersions.last.size);

  static ServiceReport deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ServiceReport decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ServiceReport result = new ServiceReport();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size != kVersions[i].size)
            throw new bindings.MojoCodecError(
                'Header doesn\'t correspond to any known version.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      result.serviceName = decoder0.decodeString(8, true);
    }
    if (mainDataHeader.version >= 0) {
      
      result.totalRequests = decoder0.decodeUint64(16);
    }
    if (mainDataHeader.version >= 0) {
      
      result.meanHealth = decoder0.decodeDouble(24);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(serviceName, 8, true);
    
    encoder0.encodeUint64(totalRequests, 16);
    
    encoder0.encodeDouble(meanHealth, 24);
  }

  String toString() {
    return "ServiceReport("
           "serviceName: $serviceName" ", "
           "totalRequests: $totalRequests" ", "
           "meanHealth: $meanHealth" ")";
  }
}

class TestTrackedRequestServiceGetReportParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  TestTrackedRequestServiceGetReportParams() : super(kVersions.last.size);

  static TestTrackedRequestServiceGetReportParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TestTrackedRequestServiceGetReportParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TestTrackedRequestServiceGetReportParams result = new TestTrackedRequestServiceGetReportParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size != kVersions[i].size)
            throw new bindings.MojoCodecError(
                'Header doesn\'t correspond to any known version.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    encoder.getStructEncoderAtOffset(kVersions.last);
  }

  String toString() {
    return "TestTrackedRequestServiceGetReportParams("")";
  }
}

class TestTrackedRequestServiceGetReportResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  List<ServiceReport> report = null;

  TestTrackedRequestServiceGetReportResponseParams() : super(kVersions.last.size);

  static TestTrackedRequestServiceGetReportResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TestTrackedRequestServiceGetReportResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TestTrackedRequestServiceGetReportResponseParams result = new TestTrackedRequestServiceGetReportResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size != kVersions[i].size)
            throw new bindings.MojoCodecError(
                'Header doesn\'t correspond to any known version.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(8, true);
      if (decoder1 == null) {
        result.report = null;
      } else {
        var si1 = decoder1.decodeDataHeaderForPointerArray(bindings.kUnspecifiedArrayLength);
        result.report = new List<ServiceReport>(si1.numElements);
        for (int i1 = 0; i1 < si1.numElements; ++i1) {
          
          var decoder2 = decoder1.decodePointer(bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i1, true);
          result.report[i1] = ServiceReport.decode(decoder2);
        }
      }
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    if (report == null) {
      encoder0.encodeNullPointer(8, true);
    } else {
      var encoder1 = encoder0.encodePointerArray(report.length, 8, bindings.kUnspecifiedArrayLength);
      for (int i0 = 0; i0 < report.length; ++i0) {
        
        encoder1.encodeStruct(report[i0], bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i0, true);
      }
    }
  }

  String toString() {
    return "TestTrackedRequestServiceGetReportResponseParams("
           "report: $report" ")";
  }
}

class TestRequestTrackerSetNameAndReturnIdParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String serviceName = null;

  TestRequestTrackerSetNameAndReturnIdParams() : super(kVersions.last.size);

  static TestRequestTrackerSetNameAndReturnIdParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TestRequestTrackerSetNameAndReturnIdParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TestRequestTrackerSetNameAndReturnIdParams result = new TestRequestTrackerSetNameAndReturnIdParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size != kVersions[i].size)
            throw new bindings.MojoCodecError(
                'Header doesn\'t correspond to any known version.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      result.serviceName = decoder0.decodeString(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(serviceName, 8, false);
  }

  String toString() {
    return "TestRequestTrackerSetNameAndReturnIdParams("
           "serviceName: $serviceName" ")";
  }
}

class TestRequestTrackerSetNameAndReturnIdResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  int id = 0;

  TestRequestTrackerSetNameAndReturnIdResponseParams() : super(kVersions.last.size);

  static TestRequestTrackerSetNameAndReturnIdResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TestRequestTrackerSetNameAndReturnIdResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TestRequestTrackerSetNameAndReturnIdResponseParams result = new TestRequestTrackerSetNameAndReturnIdResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size != kVersions[i].size)
            throw new bindings.MojoCodecError(
                'Header doesn\'t correspond to any known version.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      result.id = decoder0.decodeUint64(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeUint64(id, 8);
  }

  String toString() {
    return "TestRequestTrackerSetNameAndReturnIdResponseParams("
           "id: $id" ")";
  }
}

class TestRequestTrackerRecordStatsParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  int clientId = 0;
  ServiceStats stats = null;

  TestRequestTrackerRecordStatsParams() : super(kVersions.last.size);

  static TestRequestTrackerRecordStatsParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TestRequestTrackerRecordStatsParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TestRequestTrackerRecordStatsParams result = new TestRequestTrackerRecordStatsParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size != kVersions[i].size)
            throw new bindings.MojoCodecError(
                'Header doesn\'t correspond to any known version.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      result.clientId = decoder0.decodeUint64(8);
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(16, true);
      result.stats = ServiceStats.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeUint64(clientId, 8);
    
    encoder0.encodeStruct(stats, 16, true);
  }

  String toString() {
    return "TestRequestTrackerRecordStatsParams("
           "clientId: $clientId" ", "
           "stats: $stats" ")";
  }
}
const int kTestTrackedRequestService_getReport_name = 0;

const String TestTrackedRequestServiceName =
      'mojo::test::TestTrackedRequestService';

abstract class TestTrackedRequestService {
  Future<TestTrackedRequestServiceGetReportResponseParams> getReport([Function responseFactory = null]);

}


class TestTrackedRequestServiceProxyImpl extends bindings.Proxy {
  TestTrackedRequestServiceProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  TestTrackedRequestServiceProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  TestTrackedRequestServiceProxyImpl.unbound() : super.unbound();

  static TestTrackedRequestServiceProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TestTrackedRequestServiceProxyImpl.fromEndpoint(endpoint);

  String get name => TestTrackedRequestServiceName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kTestTrackedRequestService_getReport_name:
        var r = TestTrackedRequestServiceGetReportResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          throw 'Message had unknown request Id: ${message.header.requestId}';
        }
        completerMap.remove(message.header.requestId);
        assert(!c.isCompleted);
        c.complete(r);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }

  String toString() {
    var superString = super.toString();
    return "TestTrackedRequestServiceProxyImpl($superString)";
  }
}


class _TestTrackedRequestServiceProxyCalls implements TestTrackedRequestService {
  TestTrackedRequestServiceProxyImpl _proxyImpl;

  _TestTrackedRequestServiceProxyCalls(this._proxyImpl);
    Future<TestTrackedRequestServiceGetReportResponseParams> getReport([Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new TestTrackedRequestServiceGetReportParams();
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kTestTrackedRequestService_getReport_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
}


class TestTrackedRequestServiceProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  TestTrackedRequestService ptr;
  final String name = TestTrackedRequestServiceName;

  TestTrackedRequestServiceProxy(TestTrackedRequestServiceProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _TestTrackedRequestServiceProxyCalls(proxyImpl);

  TestTrackedRequestServiceProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new TestTrackedRequestServiceProxyImpl.fromEndpoint(endpoint) {
    ptr = new _TestTrackedRequestServiceProxyCalls(impl);
  }

  TestTrackedRequestServiceProxy.fromHandle(core.MojoHandle handle) :
      impl = new TestTrackedRequestServiceProxyImpl.fromHandle(handle) {
    ptr = new _TestTrackedRequestServiceProxyCalls(impl);
  }

  TestTrackedRequestServiceProxy.unbound() :
      impl = new TestTrackedRequestServiceProxyImpl.unbound() {
    ptr = new _TestTrackedRequestServiceProxyCalls(impl);
  }

  static TestTrackedRequestServiceProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TestTrackedRequestServiceProxy.fromEndpoint(endpoint);

  Future close({bool immediate: false}) => impl.close(immediate: immediate);

  String toString() {
    return "TestTrackedRequestServiceProxy($impl)";
  }
}


class TestTrackedRequestServiceStub extends bindings.Stub {
  TestTrackedRequestService _impl = null;

  TestTrackedRequestServiceStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  TestTrackedRequestServiceStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  TestTrackedRequestServiceStub.unbound() : super.unbound();

  static TestTrackedRequestServiceStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TestTrackedRequestServiceStub.fromEndpoint(endpoint);

  static const String name = TestTrackedRequestServiceName;


  TestTrackedRequestServiceGetReportResponseParams _TestTrackedRequestServiceGetReportResponseParamsFactory(List<ServiceReport> report) {
    var result = new TestTrackedRequestServiceGetReportResponseParams();
    result.report = report;
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_impl != null);
    switch (message.header.type) {
      case kTestTrackedRequestService_getReport_name:
        var params = TestTrackedRequestServiceGetReportParams.deserialize(
            message.payload);
        return _impl.getReport(_TestTrackedRequestServiceGetReportResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kTestTrackedRequestService_getReport_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  TestTrackedRequestService get impl => _impl;
      set impl(TestTrackedRequestService d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "TestTrackedRequestServiceStub($superString)";
  }
}

const int kTestRequestTracker_setNameAndReturnId_name = 0;
const int kTestRequestTracker_recordStats_name = 1;

const String TestRequestTrackerName =
      'mojo::test::TestRequestTracker';

abstract class TestRequestTracker {
  Future<TestRequestTrackerSetNameAndReturnIdResponseParams> setNameAndReturnId(String serviceName,[Function responseFactory = null]);
  void recordStats(int clientId, ServiceStats stats);

}


class TestRequestTrackerProxyImpl extends bindings.Proxy {
  TestRequestTrackerProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  TestRequestTrackerProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  TestRequestTrackerProxyImpl.unbound() : super.unbound();

  static TestRequestTrackerProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TestRequestTrackerProxyImpl.fromEndpoint(endpoint);

  String get name => TestRequestTrackerName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kTestRequestTracker_setNameAndReturnId_name:
        var r = TestRequestTrackerSetNameAndReturnIdResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          throw 'Message had unknown request Id: ${message.header.requestId}';
        }
        completerMap.remove(message.header.requestId);
        assert(!c.isCompleted);
        c.complete(r);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }

  String toString() {
    var superString = super.toString();
    return "TestRequestTrackerProxyImpl($superString)";
  }
}


class _TestRequestTrackerProxyCalls implements TestRequestTracker {
  TestRequestTrackerProxyImpl _proxyImpl;

  _TestRequestTrackerProxyCalls(this._proxyImpl);
    Future<TestRequestTrackerSetNameAndReturnIdResponseParams> setNameAndReturnId(String serviceName,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new TestRequestTrackerSetNameAndReturnIdParams();
      params.serviceName = serviceName;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kTestRequestTracker_setNameAndReturnId_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    void recordStats(int clientId, ServiceStats stats) {
      assert(_proxyImpl.isBound);
      var params = new TestRequestTrackerRecordStatsParams();
      params.clientId = clientId;
      params.stats = stats;
      _proxyImpl.sendMessage(params, kTestRequestTracker_recordStats_name);
    }
  
}


class TestRequestTrackerProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  TestRequestTracker ptr;
  final String name = TestRequestTrackerName;

  TestRequestTrackerProxy(TestRequestTrackerProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _TestRequestTrackerProxyCalls(proxyImpl);

  TestRequestTrackerProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new TestRequestTrackerProxyImpl.fromEndpoint(endpoint) {
    ptr = new _TestRequestTrackerProxyCalls(impl);
  }

  TestRequestTrackerProxy.fromHandle(core.MojoHandle handle) :
      impl = new TestRequestTrackerProxyImpl.fromHandle(handle) {
    ptr = new _TestRequestTrackerProxyCalls(impl);
  }

  TestRequestTrackerProxy.unbound() :
      impl = new TestRequestTrackerProxyImpl.unbound() {
    ptr = new _TestRequestTrackerProxyCalls(impl);
  }

  static TestRequestTrackerProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TestRequestTrackerProxy.fromEndpoint(endpoint);

  Future close({bool immediate: false}) => impl.close(immediate: immediate);

  String toString() {
    return "TestRequestTrackerProxy($impl)";
  }
}


class TestRequestTrackerStub extends bindings.Stub {
  TestRequestTracker _impl = null;

  TestRequestTrackerStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  TestRequestTrackerStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  TestRequestTrackerStub.unbound() : super.unbound();

  static TestRequestTrackerStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TestRequestTrackerStub.fromEndpoint(endpoint);

  static const String name = TestRequestTrackerName;


  TestRequestTrackerSetNameAndReturnIdResponseParams _TestRequestTrackerSetNameAndReturnIdResponseParamsFactory(int id) {
    var result = new TestRequestTrackerSetNameAndReturnIdResponseParams();
    result.id = id;
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_impl != null);
    switch (message.header.type) {
      case kTestRequestTracker_setNameAndReturnId_name:
        var params = TestRequestTrackerSetNameAndReturnIdParams.deserialize(
            message.payload);
        return _impl.setNameAndReturnId(params.serviceName,_TestRequestTrackerSetNameAndReturnIdResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kTestRequestTracker_setNameAndReturnId_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kTestRequestTracker_recordStats_name:
        var params = TestRequestTrackerRecordStatsParams.deserialize(
            message.payload);
        _impl.recordStats(params.clientId, params.stats);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  TestRequestTracker get impl => _impl;
      set impl(TestRequestTracker d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "TestRequestTrackerStub($superString)";
  }
}


