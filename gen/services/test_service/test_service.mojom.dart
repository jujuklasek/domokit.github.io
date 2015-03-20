// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library test_service.mojom;

import 'dart:async';
import 'dart:mojo.bindings' as bindings;
import 'dart:mojo.core' as core;


class TestServicePingParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  TestServicePingParams() : super(kStructSize);

  static TestServicePingParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TestServicePingParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TestServicePingParams result = new TestServicePingParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    encoder.getStructEncoderAtOffset(kDefaultStructInfo);
  }

  String toString() {
    return "TestServicePingParams("")";
  }
}

class TestServicePingResponseParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  TestServicePingResponseParams() : super(kStructSize);

  static TestServicePingResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TestServicePingResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TestServicePingResponseParams result = new TestServicePingResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    encoder.getStructEncoderAtOffset(kDefaultStructInfo);
  }

  String toString() {
    return "TestServicePingResponseParams("")";
  }
}

class TestServiceConnectToAppAndGetTimeParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  String appUrl = null;

  TestServiceConnectToAppAndGetTimeParams() : super(kStructSize);

  static TestServiceConnectToAppAndGetTimeParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TestServiceConnectToAppAndGetTimeParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TestServiceConnectToAppAndGetTimeParams result = new TestServiceConnectToAppAndGetTimeParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.appUrl = decoder0.decodeString(8, true);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeString(appUrl, 8, true);
  }

  String toString() {
    return "TestServiceConnectToAppAndGetTimeParams("
           "appUrl: $appUrl" ")";
  }
}

class TestServiceConnectToAppAndGetTimeResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  int timeUsec = 0;

  TestServiceConnectToAppAndGetTimeResponseParams() : super(kStructSize);

  static TestServiceConnectToAppAndGetTimeResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TestServiceConnectToAppAndGetTimeResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TestServiceConnectToAppAndGetTimeResponseParams result = new TestServiceConnectToAppAndGetTimeResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.timeUsec = decoder0.decodeInt64(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInt64(timeUsec, 8);
  }

  String toString() {
    return "TestServiceConnectToAppAndGetTimeResponseParams("
           "timeUsec: $timeUsec" ")";
  }
}

class TestServiceStartTrackingRequestsParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  TestServiceStartTrackingRequestsParams() : super(kStructSize);

  static TestServiceStartTrackingRequestsParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TestServiceStartTrackingRequestsParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TestServiceStartTrackingRequestsParams result = new TestServiceStartTrackingRequestsParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    encoder.getStructEncoderAtOffset(kDefaultStructInfo);
  }

  String toString() {
    return "TestServiceStartTrackingRequestsParams("")";
  }
}

class TestServiceStartTrackingRequestsResponseParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  TestServiceStartTrackingRequestsResponseParams() : super(kStructSize);

  static TestServiceStartTrackingRequestsResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TestServiceStartTrackingRequestsResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TestServiceStartTrackingRequestsResponseParams result = new TestServiceStartTrackingRequestsResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    encoder.getStructEncoderAtOffset(kDefaultStructInfo);
  }

  String toString() {
    return "TestServiceStartTrackingRequestsResponseParams("")";
  }
}

class TestTimeServiceGetPartyTimeParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  TestTimeServiceGetPartyTimeParams() : super(kStructSize);

  static TestTimeServiceGetPartyTimeParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TestTimeServiceGetPartyTimeParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TestTimeServiceGetPartyTimeParams result = new TestTimeServiceGetPartyTimeParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    encoder.getStructEncoderAtOffset(kDefaultStructInfo);
  }

  String toString() {
    return "TestTimeServiceGetPartyTimeParams("")";
  }
}

class TestTimeServiceGetPartyTimeResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  int timeUsec = 0;

  TestTimeServiceGetPartyTimeResponseParams() : super(kStructSize);

  static TestTimeServiceGetPartyTimeResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TestTimeServiceGetPartyTimeResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TestTimeServiceGetPartyTimeResponseParams result = new TestTimeServiceGetPartyTimeResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.timeUsec = decoder0.decodeInt64(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInt64(timeUsec, 8);
  }

  String toString() {
    return "TestTimeServiceGetPartyTimeResponseParams("
           "timeUsec: $timeUsec" ")";
  }
}

class TestTimeServiceStartTrackingRequestsParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  TestTimeServiceStartTrackingRequestsParams() : super(kStructSize);

  static TestTimeServiceStartTrackingRequestsParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TestTimeServiceStartTrackingRequestsParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TestTimeServiceStartTrackingRequestsParams result = new TestTimeServiceStartTrackingRequestsParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    encoder.getStructEncoderAtOffset(kDefaultStructInfo);
  }

  String toString() {
    return "TestTimeServiceStartTrackingRequestsParams("")";
  }
}

class TestTimeServiceStartTrackingRequestsResponseParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  TestTimeServiceStartTrackingRequestsResponseParams() : super(kStructSize);

  static TestTimeServiceStartTrackingRequestsResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TestTimeServiceStartTrackingRequestsResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TestTimeServiceStartTrackingRequestsResponseParams result = new TestTimeServiceStartTrackingRequestsResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    encoder.getStructEncoderAtOffset(kDefaultStructInfo);
  }

  String toString() {
    return "TestTimeServiceStartTrackingRequestsResponseParams("")";
  }
}
const int kTestService_ping_name = 0;
const int kTestService_connectToAppAndGetTime_name = 1;
const int kTestService_startTrackingRequests_name = 2;

const String TestServiceName =
      'mojo::test::TestService';

abstract class TestService {
  Future<TestServicePingResponseParams> ping([Function responseFactory = null]);
  Future<TestServiceConnectToAppAndGetTimeResponseParams> connectToAppAndGetTime(String appUrl,[Function responseFactory = null]);
  Future<TestServiceStartTrackingRequestsResponseParams> startTrackingRequests([Function responseFactory = null]);

}


class TestServiceProxyImpl extends bindings.Proxy {
  TestServiceProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  TestServiceProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  TestServiceProxyImpl.unbound() : super.unbound();

  static TestServiceProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TestServiceProxyImpl.fromEndpoint(endpoint);

  String get name => TestServiceName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kTestService_ping_name:
        var r = TestServicePingResponseParams.deserialize(
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
      case kTestService_connectToAppAndGetTime_name:
        var r = TestServiceConnectToAppAndGetTimeResponseParams.deserialize(
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
      case kTestService_startTrackingRequests_name:
        var r = TestServiceStartTrackingRequestsResponseParams.deserialize(
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
    return "TestServiceProxyImpl($superString)";
  }
}


class _TestServiceProxyCalls implements TestService {
  TestServiceProxyImpl _proxyImpl;

  _TestServiceProxyCalls(this._proxyImpl);
    Future<TestServicePingResponseParams> ping([Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new TestServicePingParams();
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kTestService_ping_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    Future<TestServiceConnectToAppAndGetTimeResponseParams> connectToAppAndGetTime(String appUrl,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new TestServiceConnectToAppAndGetTimeParams();
      params.appUrl = appUrl;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kTestService_connectToAppAndGetTime_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    Future<TestServiceStartTrackingRequestsResponseParams> startTrackingRequests([Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new TestServiceStartTrackingRequestsParams();
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kTestService_startTrackingRequests_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
}


class TestServiceProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  TestService ptr;
  final String name = TestServiceName;

  TestServiceProxy(TestServiceProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _TestServiceProxyCalls(proxyImpl);

  TestServiceProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new TestServiceProxyImpl.fromEndpoint(endpoint) {
    ptr = new _TestServiceProxyCalls(impl);
  }

  TestServiceProxy.fromHandle(core.MojoHandle handle) :
      impl = new TestServiceProxyImpl.fromHandle(handle) {
    ptr = new _TestServiceProxyCalls(impl);
  }

  TestServiceProxy.unbound() :
      impl = new TestServiceProxyImpl.unbound() {
    ptr = new _TestServiceProxyCalls(impl);
  }

  static TestServiceProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TestServiceProxy.fromEndpoint(endpoint);

  Future close({bool nodefer: false}) => impl.close(nodefer: nodefer);

  String toString() {
    return "TestServiceProxy($impl)";
  }
}


class TestServiceStub extends bindings.Stub {
  TestService _impl = null;

  TestServiceStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  TestServiceStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  TestServiceStub.unbound() : super.unbound();

  static TestServiceStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TestServiceStub.fromEndpoint(endpoint);

  static const String name = TestServiceName;


  TestServicePingResponseParams _TestServicePingResponseParamsFactory() {
    var result = new TestServicePingResponseParams();
    return result;
  }
  TestServiceConnectToAppAndGetTimeResponseParams _TestServiceConnectToAppAndGetTimeResponseParamsFactory(int timeUsec) {
    var result = new TestServiceConnectToAppAndGetTimeResponseParams();
    result.timeUsec = timeUsec;
    return result;
  }
  TestServiceStartTrackingRequestsResponseParams _TestServiceStartTrackingRequestsResponseParamsFactory() {
    var result = new TestServiceStartTrackingRequestsResponseParams();
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_impl != null);
    switch (message.header.type) {
      case kTestService_ping_name:
        var params = TestServicePingParams.deserialize(
            message.payload);
        return _impl.ping(_TestServicePingResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kTestService_ping_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kTestService_connectToAppAndGetTime_name:
        var params = TestServiceConnectToAppAndGetTimeParams.deserialize(
            message.payload);
        return _impl.connectToAppAndGetTime(params.appUrl,_TestServiceConnectToAppAndGetTimeResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kTestService_connectToAppAndGetTime_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kTestService_startTrackingRequests_name:
        var params = TestServiceStartTrackingRequestsParams.deserialize(
            message.payload);
        return _impl.startTrackingRequests(_TestServiceStartTrackingRequestsResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kTestService_startTrackingRequests_name,
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

  TestService get impl => _impl;
      set impl(TestService d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "TestServiceStub($superString)";
  }
}

const int kTestTimeService_getPartyTime_name = 0;
const int kTestTimeService_startTrackingRequests_name = 1;

const String TestTimeServiceName =
      'mojo::test::TestTimeService';

abstract class TestTimeService {
  Future<TestTimeServiceGetPartyTimeResponseParams> getPartyTime([Function responseFactory = null]);
  Future<TestTimeServiceStartTrackingRequestsResponseParams> startTrackingRequests([Function responseFactory = null]);

}


class TestTimeServiceProxyImpl extends bindings.Proxy {
  TestTimeServiceProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  TestTimeServiceProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  TestTimeServiceProxyImpl.unbound() : super.unbound();

  static TestTimeServiceProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TestTimeServiceProxyImpl.fromEndpoint(endpoint);

  String get name => TestTimeServiceName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kTestTimeService_getPartyTime_name:
        var r = TestTimeServiceGetPartyTimeResponseParams.deserialize(
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
      case kTestTimeService_startTrackingRequests_name:
        var r = TestTimeServiceStartTrackingRequestsResponseParams.deserialize(
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
    return "TestTimeServiceProxyImpl($superString)";
  }
}


class _TestTimeServiceProxyCalls implements TestTimeService {
  TestTimeServiceProxyImpl _proxyImpl;

  _TestTimeServiceProxyCalls(this._proxyImpl);
    Future<TestTimeServiceGetPartyTimeResponseParams> getPartyTime([Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new TestTimeServiceGetPartyTimeParams();
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kTestTimeService_getPartyTime_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    Future<TestTimeServiceStartTrackingRequestsResponseParams> startTrackingRequests([Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new TestTimeServiceStartTrackingRequestsParams();
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kTestTimeService_startTrackingRequests_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
}


class TestTimeServiceProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  TestTimeService ptr;
  final String name = TestTimeServiceName;

  TestTimeServiceProxy(TestTimeServiceProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _TestTimeServiceProxyCalls(proxyImpl);

  TestTimeServiceProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new TestTimeServiceProxyImpl.fromEndpoint(endpoint) {
    ptr = new _TestTimeServiceProxyCalls(impl);
  }

  TestTimeServiceProxy.fromHandle(core.MojoHandle handle) :
      impl = new TestTimeServiceProxyImpl.fromHandle(handle) {
    ptr = new _TestTimeServiceProxyCalls(impl);
  }

  TestTimeServiceProxy.unbound() :
      impl = new TestTimeServiceProxyImpl.unbound() {
    ptr = new _TestTimeServiceProxyCalls(impl);
  }

  static TestTimeServiceProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TestTimeServiceProxy.fromEndpoint(endpoint);

  Future close({bool nodefer: false}) => impl.close(nodefer: nodefer);

  String toString() {
    return "TestTimeServiceProxy($impl)";
  }
}


class TestTimeServiceStub extends bindings.Stub {
  TestTimeService _impl = null;

  TestTimeServiceStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  TestTimeServiceStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  TestTimeServiceStub.unbound() : super.unbound();

  static TestTimeServiceStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TestTimeServiceStub.fromEndpoint(endpoint);

  static const String name = TestTimeServiceName;


  TestTimeServiceGetPartyTimeResponseParams _TestTimeServiceGetPartyTimeResponseParamsFactory(int timeUsec) {
    var result = new TestTimeServiceGetPartyTimeResponseParams();
    result.timeUsec = timeUsec;
    return result;
  }
  TestTimeServiceStartTrackingRequestsResponseParams _TestTimeServiceStartTrackingRequestsResponseParamsFactory() {
    var result = new TestTimeServiceStartTrackingRequestsResponseParams();
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_impl != null);
    switch (message.header.type) {
      case kTestTimeService_getPartyTime_name:
        var params = TestTimeServiceGetPartyTimeParams.deserialize(
            message.payload);
        return _impl.getPartyTime(_TestTimeServiceGetPartyTimeResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kTestTimeService_getPartyTime_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kTestTimeService_startTrackingRequests_name:
        var params = TestTimeServiceStartTrackingRequestsParams.deserialize(
            message.payload);
        return _impl.startTrackingRequests(_TestTimeServiceStartTrackingRequestsResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kTestTimeService_startTrackingRequests_name,
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

  TestTimeService get impl => _impl;
      set impl(TestTimeService d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "TestTimeServiceStub($superString)";
  }
}


