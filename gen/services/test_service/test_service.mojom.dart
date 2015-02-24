// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library test_service.mojom;

import 'dart:async';
import 'dart:mojo_bindings' as bindings;
import 'dart:mojo_core' as core;


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
}

class TestServiceConnectToAppAndGetTimeParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
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
        (mainDataHeader.version < 1)) {
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
}

class TestServiceConnectToAppAndGetTimeResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
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
        (mainDataHeader.version < 1)) {
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
}

class TestTimeServiceGetPartyTimeResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
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
        (mainDataHeader.version < 1)) {
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
}
const int kTestService_ping_name = 0;
const int kTestService_connectToAppAndGetTime_name = 1;
const int kTestService_startTrackingRequests_name = 2;

abstract class TestService implements core.Listener {
  static const String name = 'mojo::test::TestService';
  TestServiceStub stub;

  TestService(core.MojoMessagePipeEndpoint endpoint) :
      stub = new TestServiceStub(endpoint);

  TestService.fromHandle(core.MojoHandle handle) :
      stub = new TestServiceStub.fromHandle(handle);

  TestService.fromStub(this.stub);

  TestService.unbound() :
      stub = new TestServiceStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  TestService get delegate => stub.delegate;
  set delegate(TestService d) {
    stub.delegate = d;
  }
  Future<TestServicePingResponseParams> ping([Function responseFactory = null]);
  Future<TestServiceConnectToAppAndGetTimeResponseParams> connectToAppAndGetTime(String appUrl,[Function responseFactory = null]);
  Future<TestServiceStartTrackingRequestsResponseParams> startTrackingRequests([Function responseFactory = null]);

}

class TestServiceProxy extends bindings.Proxy implements TestService {
  TestServiceProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  TestServiceProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  TestServiceProxy.unbound() : super.unbound();

  String get name => TestService.name;

  static TestServiceProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TestServiceProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kTestService_ping_name:
        var r = TestServicePingResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      case kTestService_connectToAppAndGetTime_name:
        var r = TestServiceConnectToAppAndGetTimeResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      case kTestService_startTrackingRequests_name:
        var r = TestServiceStartTrackingRequestsResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
  Future<TestServicePingResponseParams> ping([Function responseFactory = null]) {
    var params = new TestServicePingParams();
    return sendMessageWithRequestId(
        params,
        kTestService_ping_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  Future<TestServiceConnectToAppAndGetTimeResponseParams> connectToAppAndGetTime(String appUrl,[Function responseFactory = null]) {
    var params = new TestServiceConnectToAppAndGetTimeParams();
    params.appUrl = appUrl;
    return sendMessageWithRequestId(
        params,
        kTestService_connectToAppAndGetTime_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  Future<TestServiceStartTrackingRequestsResponseParams> startTrackingRequests([Function responseFactory = null]) {
    var params = new TestServiceStartTrackingRequestsParams();
    return sendMessageWithRequestId(
        params,
        kTestService_startTrackingRequests_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
}

class TestServiceStub extends bindings.Stub {
  TestService _delegate = null;

  TestServiceStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  TestServiceStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  TestServiceStub.unbound() : super.unbound();

  static TestServiceStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TestServiceStub(endpoint);

  static const String name = TestService.name;


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
    assert(_delegate != null);
    switch (message.header.type) {
      case kTestService_ping_name:
        var params = TestServicePingParams.deserialize(
            message.payload);
        return _delegate.ping(_TestServicePingResponseParamsFactory).then((response) {
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
        return _delegate.connectToAppAndGetTime(params.appUrl,_TestServiceConnectToAppAndGetTimeResponseParamsFactory).then((response) {
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
        return _delegate.startTrackingRequests(_TestServiceStartTrackingRequestsResponseParamsFactory).then((response) {
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

  TestService get delegate => _delegate;
      set delegate(TestService d) {
    assert(_delegate == null);
    _delegate = d;
  }
}



const int kTestTimeService_getPartyTime_name = 0;
const int kTestTimeService_startTrackingRequests_name = 1;

abstract class TestTimeService implements core.Listener {
  static const String name = 'mojo::test::TestTimeService';
  TestTimeServiceStub stub;

  TestTimeService(core.MojoMessagePipeEndpoint endpoint) :
      stub = new TestTimeServiceStub(endpoint);

  TestTimeService.fromHandle(core.MojoHandle handle) :
      stub = new TestTimeServiceStub.fromHandle(handle);

  TestTimeService.fromStub(this.stub);

  TestTimeService.unbound() :
      stub = new TestTimeServiceStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  TestTimeService get delegate => stub.delegate;
  set delegate(TestTimeService d) {
    stub.delegate = d;
  }
  Future<TestTimeServiceGetPartyTimeResponseParams> getPartyTime([Function responseFactory = null]);
  Future<TestTimeServiceStartTrackingRequestsResponseParams> startTrackingRequests([Function responseFactory = null]);

}

class TestTimeServiceProxy extends bindings.Proxy implements TestTimeService {
  TestTimeServiceProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  TestTimeServiceProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  TestTimeServiceProxy.unbound() : super.unbound();

  String get name => TestTimeService.name;

  static TestTimeServiceProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TestTimeServiceProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kTestTimeService_getPartyTime_name:
        var r = TestTimeServiceGetPartyTimeResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      case kTestTimeService_startTrackingRequests_name:
        var r = TestTimeServiceStartTrackingRequestsResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
  Future<TestTimeServiceGetPartyTimeResponseParams> getPartyTime([Function responseFactory = null]) {
    var params = new TestTimeServiceGetPartyTimeParams();
    return sendMessageWithRequestId(
        params,
        kTestTimeService_getPartyTime_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  Future<TestTimeServiceStartTrackingRequestsResponseParams> startTrackingRequests([Function responseFactory = null]) {
    var params = new TestTimeServiceStartTrackingRequestsParams();
    return sendMessageWithRequestId(
        params,
        kTestTimeService_startTrackingRequests_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
}

class TestTimeServiceStub extends bindings.Stub {
  TestTimeService _delegate = null;

  TestTimeServiceStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  TestTimeServiceStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  TestTimeServiceStub.unbound() : super.unbound();

  static TestTimeServiceStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TestTimeServiceStub(endpoint);

  static const String name = TestTimeService.name;


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
    assert(_delegate != null);
    switch (message.header.type) {
      case kTestTimeService_getPartyTime_name:
        var params = TestTimeServiceGetPartyTimeParams.deserialize(
            message.payload);
        return _delegate.getPartyTime(_TestTimeServiceGetPartyTimeResponseParamsFactory).then((response) {
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
        return _delegate.startTrackingRequests(_TestTimeServiceStartTrackingRequestsResponseParamsFactory).then((response) {
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

  TestTimeService get delegate => _delegate;
      set delegate(TestTimeService d) {
    assert(_delegate == null);
    _delegate = d;
  }
}




