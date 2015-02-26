// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library test.mojom;

import 'dart:async';
import 'mojo:bindings' as bindings;
import 'mojo:core' as core;


class TestServiceTestParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  String testString = null;

  TestServiceTestParams() : super(kStructSize);

  static TestServiceTestParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TestServiceTestParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TestServiceTestParams result = new TestServiceTestParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.testString = decoder0.decodeString(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeString(testString, 8, false);
  }
}

class TestServiceTestResponseParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  TestServiceTestResponseParams() : super(kStructSize);

  static TestServiceTestResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TestServiceTestResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TestServiceTestResponseParams result = new TestServiceTestResponseParams();

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

class TestACallBParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  TestACallBParams() : super(kStructSize);

  static TestACallBParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TestACallBParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TestACallBParams result = new TestACallBParams();

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

class TestACallCFromBParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  TestACallCFromBParams() : super(kStructSize);

  static TestACallCFromBParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TestACallCFromBParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TestACallCFromBParams result = new TestACallCFromBParams();

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

class TestBBParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  TestBBParams() : super(kStructSize);

  static TestBBParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TestBBParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TestBBParams result = new TestBBParams();

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

class TestBBResponseParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  TestBBResponseParams() : super(kStructSize);

  static TestBBResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TestBBResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TestBBResponseParams result = new TestBBResponseParams();

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

class TestBCallCParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  TestBCallCParams() : super(kStructSize);

  static TestBCallCParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TestBCallCParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TestBCallCParams result = new TestBCallCParams();

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

class TestBCallCResponseParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  TestBCallCResponseParams() : super(kStructSize);

  static TestBCallCResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TestBCallCResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TestBCallCResponseParams result = new TestBCallCResponseParams();

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

class TestCCParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  TestCCParams() : super(kStructSize);

  static TestCCParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TestCCParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TestCCParams result = new TestCCParams();

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

class TestCCResponseParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  TestCCResponseParams() : super(kStructSize);

  static TestCCResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TestCCResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TestCCResponseParams result = new TestCCResponseParams();

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
const int kTestService_test_name = 0;

abstract class TestService implements core.Listener {
  static const String name = 'mojo::TestService';
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
  Future<TestServiceTestResponseParams> test(String testString,[Function responseFactory = null]);

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
      case kTestService_test_name:
        var r = TestServiceTestResponseParams.deserialize(
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
  Future<TestServiceTestResponseParams> test(String testString,[Function responseFactory = null]) {
    var params = new TestServiceTestParams();
    params.testString = testString;
    return sendMessageWithRequestId(
        params,
        kTestService_test_name,
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


  TestServiceTestResponseParams _TestServiceTestResponseParamsFactory() {
    var result = new TestServiceTestResponseParams();
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kTestService_test_name:
        var params = TestServiceTestParams.deserialize(
            message.payload);
        return _delegate.test(params.testString,_TestServiceTestResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kTestService_test_name,
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



const int kTestA_callB_name = 0;
const int kTestA_callCFromB_name = 1;

abstract class TestA implements core.Listener {
  static const String name = 'mojo::TestA';
  TestAStub stub;

  TestA(core.MojoMessagePipeEndpoint endpoint) :
      stub = new TestAStub(endpoint);

  TestA.fromHandle(core.MojoHandle handle) :
      stub = new TestAStub.fromHandle(handle);

  TestA.fromStub(this.stub);

  TestA.unbound() :
      stub = new TestAStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  TestA get delegate => stub.delegate;
  set delegate(TestA d) {
    stub.delegate = d;
  }
  void callB();
  void callCFromB();

}

class TestAProxy extends bindings.Proxy implements TestA {
  TestAProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  TestAProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  TestAProxy.unbound() : super.unbound();

  String get name => TestA.name;

  static TestAProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TestAProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
  void callB() {
    var params = new TestACallBParams();
    sendMessage(params, kTestA_callB_name);
  }

  void callCFromB() {
    var params = new TestACallCFromBParams();
    sendMessage(params, kTestA_callCFromB_name);
  }

}

class TestAStub extends bindings.Stub {
  TestA _delegate = null;

  TestAStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  TestAStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  TestAStub.unbound() : super.unbound();

  static TestAStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TestAStub(endpoint);

  static const String name = TestA.name;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kTestA_callB_name:
        var params = TestACallBParams.deserialize(
            message.payload);
        _delegate.callB();
        break;
      case kTestA_callCFromB_name:
        var params = TestACallCFromBParams.deserialize(
            message.payload);
        _delegate.callCFromB();
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  TestA get delegate => _delegate;
      set delegate(TestA d) {
    assert(_delegate == null);
    _delegate = d;
  }
}



const int kTestB_b_name = 0;
const int kTestB_callC_name = 1;

abstract class TestB implements core.Listener {
  static const String name = 'mojo::TestB';
  TestBStub stub;

  TestB(core.MojoMessagePipeEndpoint endpoint) :
      stub = new TestBStub(endpoint);

  TestB.fromHandle(core.MojoHandle handle) :
      stub = new TestBStub.fromHandle(handle);

  TestB.fromStub(this.stub);

  TestB.unbound() :
      stub = new TestBStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  TestB get delegate => stub.delegate;
  set delegate(TestB d) {
    stub.delegate = d;
  }
  Future<TestBBResponseParams> b([Function responseFactory = null]);
  Future<TestBCallCResponseParams> callC([Function responseFactory = null]);

}

class TestBProxy extends bindings.Proxy implements TestB {
  TestBProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  TestBProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  TestBProxy.unbound() : super.unbound();

  String get name => TestB.name;

  static TestBProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TestBProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kTestB_b_name:
        var r = TestBBResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      case kTestB_callC_name:
        var r = TestBCallCResponseParams.deserialize(
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
  Future<TestBBResponseParams> b([Function responseFactory = null]) {
    var params = new TestBBParams();
    return sendMessageWithRequestId(
        params,
        kTestB_b_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  Future<TestBCallCResponseParams> callC([Function responseFactory = null]) {
    var params = new TestBCallCParams();
    return sendMessageWithRequestId(
        params,
        kTestB_callC_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
}

class TestBStub extends bindings.Stub {
  TestB _delegate = null;

  TestBStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  TestBStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  TestBStub.unbound() : super.unbound();

  static TestBStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TestBStub(endpoint);

  static const String name = TestB.name;


  TestBBResponseParams _TestBBResponseParamsFactory() {
    var result = new TestBBResponseParams();
    return result;
  }
  TestBCallCResponseParams _TestBCallCResponseParamsFactory() {
    var result = new TestBCallCResponseParams();
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kTestB_b_name:
        var params = TestBBParams.deserialize(
            message.payload);
        return _delegate.b(_TestBBResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kTestB_b_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kTestB_callC_name:
        var params = TestBCallCParams.deserialize(
            message.payload);
        return _delegate.callC(_TestBCallCResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kTestB_callC_name,
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

  TestB get delegate => _delegate;
      set delegate(TestB d) {
    assert(_delegate == null);
    _delegate = d;
  }
}



const int kTestC_c_name = 0;

abstract class TestC implements core.Listener {
  static const String name = 'mojo::TestC';
  TestCStub stub;

  TestC(core.MojoMessagePipeEndpoint endpoint) :
      stub = new TestCStub(endpoint);

  TestC.fromHandle(core.MojoHandle handle) :
      stub = new TestCStub.fromHandle(handle);

  TestC.fromStub(this.stub);

  TestC.unbound() :
      stub = new TestCStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  TestC get delegate => stub.delegate;
  set delegate(TestC d) {
    stub.delegate = d;
  }
  Future<TestCCResponseParams> c([Function responseFactory = null]);

}

class TestCProxy extends bindings.Proxy implements TestC {
  TestCProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  TestCProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  TestCProxy.unbound() : super.unbound();

  String get name => TestC.name;

  static TestCProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TestCProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kTestC_c_name:
        var r = TestCCResponseParams.deserialize(
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
  Future<TestCCResponseParams> c([Function responseFactory = null]) {
    var params = new TestCCParams();
    return sendMessageWithRequestId(
        params,
        kTestC_c_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
}

class TestCStub extends bindings.Stub {
  TestC _delegate = null;

  TestCStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  TestCStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  TestCStub.unbound() : super.unbound();

  static TestCStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TestCStub(endpoint);

  static const String name = TestC.name;


  TestCCResponseParams _TestCCResponseParamsFactory() {
    var result = new TestCCResponseParams();
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kTestC_c_name:
        var params = TestCCParams.deserialize(
            message.payload);
        return _delegate.c(_TestCCResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kTestC_c_name,
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

  TestC get delegate => _delegate;
      set delegate(TestC d) {
    assert(_delegate == null);
    _delegate = d;
  }
}




