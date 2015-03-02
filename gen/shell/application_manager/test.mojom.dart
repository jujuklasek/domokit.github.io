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

const String TestServiceName =
      'mojo::TestService';

abstract class TestService {
  Future<TestServiceTestResponseParams> test(String testString,[Function responseFactory = null]);

}


class TestServiceProxyImpl extends bindings.Proxy {
  TestServiceProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  TestServiceProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  TestServiceProxyImpl.unbound() : super.unbound();

  static TestServiceProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TestServiceProxyImpl.fromEndpoint(endpoint);

  String get name => TestServiceName;

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
}


class _TestServiceProxyCalls implements TestService {
  TestServiceProxyImpl _proxyImpl;

  _TestServiceProxyCalls(this._proxyImpl);
    Future<TestServiceTestResponseParams> test(String testString,[Function responseFactory = null]) {
      var params = new TestServiceTestParams();
      params.testString = testString;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kTestService_test_name,
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

  void close() => impl.close();
}


class TestServiceStub extends bindings.Stub {
  TestService _delegate = null;

  TestServiceStub.fromEndpoint(core.MojoMessagePipeEndpoint endpoint) :
      super(endpoint);

  TestServiceStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  TestServiceStub.unbound() : super.unbound();

  static TestServiceStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TestServiceStub.fromEndpoint(endpoint);

  static const String name = TestServiceName;


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

const String TestAName =
      'mojo::TestA';

abstract class TestA {
  void callB();
  void callCFromB();

}


class TestAProxyImpl extends bindings.Proxy {
  TestAProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  TestAProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  TestAProxyImpl.unbound() : super.unbound();

  static TestAProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TestAProxyImpl.fromEndpoint(endpoint);

  String get name => TestAName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
}


class _TestAProxyCalls implements TestA {
  TestAProxyImpl _proxyImpl;

  _TestAProxyCalls(this._proxyImpl);
    void callB() {
      var params = new TestACallBParams();
      _proxyImpl.sendMessage(params, kTestA_callB_name);
    }
  
    void callCFromB() {
      var params = new TestACallCFromBParams();
      _proxyImpl.sendMessage(params, kTestA_callCFromB_name);
    }
  
}


class TestAProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  TestA ptr;
  final String name = TestAName;

  TestAProxy(TestAProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _TestAProxyCalls(proxyImpl);

  TestAProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new TestAProxyImpl.fromEndpoint(endpoint) {
    ptr = new _TestAProxyCalls(impl);
  }

  TestAProxy.fromHandle(core.MojoHandle handle) :
      impl = new TestAProxyImpl.fromHandle(handle) {
    ptr = new _TestAProxyCalls(impl);
  }

  TestAProxy.unbound() :
      impl = new TestAProxyImpl.unbound() {
    ptr = new _TestAProxyCalls(impl);
  }

  static TestAProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TestAProxy.fromEndpoint(endpoint);

  void close() => impl.close();
}


class TestAStub extends bindings.Stub {
  TestA _delegate = null;

  TestAStub.fromEndpoint(core.MojoMessagePipeEndpoint endpoint) :
      super(endpoint);

  TestAStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  TestAStub.unbound() : super.unbound();

  static TestAStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TestAStub.fromEndpoint(endpoint);

  static const String name = TestAName;



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

const String TestBName =
      'mojo::TestB';

abstract class TestB {
  Future<TestBBResponseParams> b([Function responseFactory = null]);
  Future<TestBCallCResponseParams> callC([Function responseFactory = null]);

}


class TestBProxyImpl extends bindings.Proxy {
  TestBProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  TestBProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  TestBProxyImpl.unbound() : super.unbound();

  static TestBProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TestBProxyImpl.fromEndpoint(endpoint);

  String get name => TestBName;

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
}


class _TestBProxyCalls implements TestB {
  TestBProxyImpl _proxyImpl;

  _TestBProxyCalls(this._proxyImpl);
    Future<TestBBResponseParams> b([Function responseFactory = null]) {
      var params = new TestBBParams();
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kTestB_b_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    Future<TestBCallCResponseParams> callC([Function responseFactory = null]) {
      var params = new TestBCallCParams();
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kTestB_callC_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
}


class TestBProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  TestB ptr;
  final String name = TestBName;

  TestBProxy(TestBProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _TestBProxyCalls(proxyImpl);

  TestBProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new TestBProxyImpl.fromEndpoint(endpoint) {
    ptr = new _TestBProxyCalls(impl);
  }

  TestBProxy.fromHandle(core.MojoHandle handle) :
      impl = new TestBProxyImpl.fromHandle(handle) {
    ptr = new _TestBProxyCalls(impl);
  }

  TestBProxy.unbound() :
      impl = new TestBProxyImpl.unbound() {
    ptr = new _TestBProxyCalls(impl);
  }

  static TestBProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TestBProxy.fromEndpoint(endpoint);

  void close() => impl.close();
}


class TestBStub extends bindings.Stub {
  TestB _delegate = null;

  TestBStub.fromEndpoint(core.MojoMessagePipeEndpoint endpoint) :
      super(endpoint);

  TestBStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  TestBStub.unbound() : super.unbound();

  static TestBStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TestBStub.fromEndpoint(endpoint);

  static const String name = TestBName;


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

const String TestCName =
      'mojo::TestC';

abstract class TestC {
  Future<TestCCResponseParams> c([Function responseFactory = null]);

}


class TestCProxyImpl extends bindings.Proxy {
  TestCProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  TestCProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  TestCProxyImpl.unbound() : super.unbound();

  static TestCProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TestCProxyImpl.fromEndpoint(endpoint);

  String get name => TestCName;

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
}


class _TestCProxyCalls implements TestC {
  TestCProxyImpl _proxyImpl;

  _TestCProxyCalls(this._proxyImpl);
    Future<TestCCResponseParams> c([Function responseFactory = null]) {
      var params = new TestCCParams();
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kTestC_c_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
}


class TestCProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  TestC ptr;
  final String name = TestCName;

  TestCProxy(TestCProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _TestCProxyCalls(proxyImpl);

  TestCProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new TestCProxyImpl.fromEndpoint(endpoint) {
    ptr = new _TestCProxyCalls(impl);
  }

  TestCProxy.fromHandle(core.MojoHandle handle) :
      impl = new TestCProxyImpl.fromHandle(handle) {
    ptr = new _TestCProxyCalls(impl);
  }

  TestCProxy.unbound() :
      impl = new TestCProxyImpl.unbound() {
    ptr = new _TestCProxyCalls(impl);
  }

  static TestCProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TestCProxy.fromEndpoint(endpoint);

  void close() => impl.close();
}


class TestCStub extends bindings.Stub {
  TestC _delegate = null;

  TestCStub.fromEndpoint(core.MojoMessagePipeEndpoint endpoint) :
      super(endpoint);

  TestCStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  TestCStub.unbound() : super.unbound();

  static TestCStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TestCStub.fromEndpoint(endpoint);

  static const String name = TestCName;


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


