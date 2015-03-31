// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library test.mojom;

import 'dart:async';

import 'package:mojo/public/dart/bindings.dart' as bindings;
import 'package:mojo/public/dart/core.dart' as core;


class TestServiceTestParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String testString = null;

  TestServiceTestParams() : super(kVersions.last.size);

  static TestServiceTestParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TestServiceTestParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TestServiceTestParams result = new TestServiceTestParams();

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
      
      result.testString = decoder0.decodeString(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(testString, 8, false);
  }

  String toString() {
    return "TestServiceTestParams("
           "testString: $testString" ")";
  }
}

class TestServiceTestResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  TestServiceTestResponseParams() : super(kVersions.last.size);

  static TestServiceTestResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TestServiceTestResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TestServiceTestResponseParams result = new TestServiceTestResponseParams();

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
    return "TestServiceTestResponseParams("")";
  }
}

class TestACallBParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  TestACallBParams() : super(kVersions.last.size);

  static TestACallBParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TestACallBParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TestACallBParams result = new TestACallBParams();

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
    return "TestACallBParams("")";
  }
}

class TestACallCFromBParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  TestACallCFromBParams() : super(kVersions.last.size);

  static TestACallCFromBParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TestACallCFromBParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TestACallCFromBParams result = new TestACallCFromBParams();

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
    return "TestACallCFromBParams("")";
  }
}

class TestBBParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  TestBBParams() : super(kVersions.last.size);

  static TestBBParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TestBBParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TestBBParams result = new TestBBParams();

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
    return "TestBBParams("")";
  }
}

class TestBBResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  TestBBResponseParams() : super(kVersions.last.size);

  static TestBBResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TestBBResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TestBBResponseParams result = new TestBBResponseParams();

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
    return "TestBBResponseParams("")";
  }
}

class TestBCallCParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  TestBCallCParams() : super(kVersions.last.size);

  static TestBCallCParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TestBCallCParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TestBCallCParams result = new TestBCallCParams();

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
    return "TestBCallCParams("")";
  }
}

class TestBCallCResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  TestBCallCResponseParams() : super(kVersions.last.size);

  static TestBCallCResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TestBCallCResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TestBCallCResponseParams result = new TestBCallCResponseParams();

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
    return "TestBCallCResponseParams("")";
  }
}

class TestCCParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  TestCCParams() : super(kVersions.last.size);

  static TestCCParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TestCCParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TestCCParams result = new TestCCParams();

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
    return "TestCCParams("")";
  }
}

class TestCCResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  TestCCResponseParams() : super(kVersions.last.size);

  static TestCCResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TestCCResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TestCCResponseParams result = new TestCCResponseParams();

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
    return "TestCCResponseParams("")";
  }
}
const int kTestService_test_name = 0;

const String TestServiceName =
      'mojo::shell::TestService';

abstract class TestService {
  Future<TestServiceTestResponseParams> test(String testString,[Function responseFactory = null]);

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
      case kTestService_test_name:
        var r = TestServiceTestResponseParams.deserialize(
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
    Future<TestServiceTestResponseParams> test(String testString,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
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


  TestServiceTestResponseParams _TestServiceTestResponseParamsFactory() {
    var result = new TestServiceTestResponseParams();
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_impl != null);
    switch (message.header.type) {
      case kTestService_test_name:
        var params = TestServiceTestParams.deserialize(
            message.payload);
        return _impl.test(params.testString,_TestServiceTestResponseParamsFactory).then((response) {
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

const int kTestA_callB_name = 0;
const int kTestA_callCFromB_name = 1;

const String TestAName =
      'mojo::shell::TestA';

abstract class TestA {
  void callB();
  void callCFromB();

}


class TestAProxyImpl extends bindings.Proxy {
  TestAProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

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

  String toString() {
    var superString = super.toString();
    return "TestAProxyImpl($superString)";
  }
}


class _TestAProxyCalls implements TestA {
  TestAProxyImpl _proxyImpl;

  _TestAProxyCalls(this._proxyImpl);
    void callB() {
      assert(_proxyImpl.isBound);
      var params = new TestACallBParams();
      _proxyImpl.sendMessage(params, kTestA_callB_name);
    }
  
    void callCFromB() {
      assert(_proxyImpl.isBound);
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

  Future close({bool nodefer: false}) => impl.close(nodefer: nodefer);

  String toString() {
    return "TestAProxy($impl)";
  }
}


class TestAStub extends bindings.Stub {
  TestA _impl = null;

  TestAStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  TestAStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  TestAStub.unbound() : super.unbound();

  static TestAStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TestAStub.fromEndpoint(endpoint);

  static const String name = TestAName;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_impl != null);
    switch (message.header.type) {
      case kTestA_callB_name:
        var params = TestACallBParams.deserialize(
            message.payload);
        _impl.callB();
        break;
      case kTestA_callCFromB_name:
        var params = TestACallCFromBParams.deserialize(
            message.payload);
        _impl.callCFromB();
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  TestA get impl => _impl;
      set impl(TestA d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "TestAStub($superString)";
  }
}

const int kTestB_b_name = 0;
const int kTestB_callC_name = 1;

const String TestBName =
      'mojo::shell::TestB';

abstract class TestB {
  Future<TestBBResponseParams> b([Function responseFactory = null]);
  Future<TestBCallCResponseParams> callC([Function responseFactory = null]);

}


class TestBProxyImpl extends bindings.Proxy {
  TestBProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

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
        if (c == null) {
          throw 'Message had unknown request Id: ${message.header.requestId}';
        }
        completerMap.remove(message.header.requestId);
        assert(!c.isCompleted);
        c.complete(r);
        break;
      case kTestB_callC_name:
        var r = TestBCallCResponseParams.deserialize(
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
    return "TestBProxyImpl($superString)";
  }
}


class _TestBProxyCalls implements TestB {
  TestBProxyImpl _proxyImpl;

  _TestBProxyCalls(this._proxyImpl);
    Future<TestBBResponseParams> b([Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new TestBBParams();
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kTestB_b_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    Future<TestBCallCResponseParams> callC([Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
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

  Future close({bool nodefer: false}) => impl.close(nodefer: nodefer);

  String toString() {
    return "TestBProxy($impl)";
  }
}


class TestBStub extends bindings.Stub {
  TestB _impl = null;

  TestBStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  TestBStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

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
    assert(_impl != null);
    switch (message.header.type) {
      case kTestB_b_name:
        var params = TestBBParams.deserialize(
            message.payload);
        return _impl.b(_TestBBResponseParamsFactory).then((response) {
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
        return _impl.callC(_TestBCallCResponseParamsFactory).then((response) {
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

  TestB get impl => _impl;
      set impl(TestB d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "TestBStub($superString)";
  }
}

const int kTestC_c_name = 0;

const String TestCName =
      'mojo::shell::TestC';

abstract class TestC {
  Future<TestCCResponseParams> c([Function responseFactory = null]);

}


class TestCProxyImpl extends bindings.Proxy {
  TestCProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

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
    return "TestCProxyImpl($superString)";
  }
}


class _TestCProxyCalls implements TestC {
  TestCProxyImpl _proxyImpl;

  _TestCProxyCalls(this._proxyImpl);
    Future<TestCCResponseParams> c([Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
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

  Future close({bool nodefer: false}) => impl.close(nodefer: nodefer);

  String toString() {
    return "TestCProxy($impl)";
  }
}


class TestCStub extends bindings.Stub {
  TestC _impl = null;

  TestCStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  TestCStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

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
    assert(_impl != null);
    switch (message.header.type) {
      case kTestC_c_name:
        var params = TestCCParams.deserialize(
            message.payload);
        return _impl.c(_TestCCResponseParamsFactory).then((response) {
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

  TestC get impl => _impl;
      set impl(TestC d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "TestCStub($superString)";
  }
}


