// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library test_harness.mojom;

import 'dart:async';
import 'mojo:bindings' as bindings;
import 'mojo:core' as core;
import 'package:mojo/services/input_events/public/interfaces/input_events.mojom.dart' as input_events_mojom;


class TestHarnessOnTestCompleteParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
  String testResult = null;
  List<int> pixels = null;

  TestHarnessOnTestCompleteParams() : super(kStructSize);

  static TestHarnessOnTestCompleteParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TestHarnessOnTestCompleteParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TestHarnessOnTestCompleteParams result = new TestHarnessOnTestCompleteParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 2)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.testResult = decoder0.decodeString(8, false);
    }
    {
      
      result.pixels = decoder0.decodeUint8Array(16, bindings.kArrayNullable, bindings.kUnspecifiedArrayLength);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeString(testResult, 8, false);
    
    encoder0.encodeUint8Array(pixels, 16, bindings.kArrayNullable, bindings.kUnspecifiedArrayLength);
  }
}

class TestHarnessDispatchInputEventParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  input_events_mojom.Event event = null;

  TestHarnessDispatchInputEventParams() : super(kStructSize);

  static TestHarnessDispatchInputEventParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TestHarnessDispatchInputEventParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TestHarnessDispatchInputEventParams result = new TestHarnessDispatchInputEventParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.event = input_events_mojom.Event.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(event, 8, false);
  }
}
const int kTestHarness_onTestComplete_name = 0;
const int kTestHarness_dispatchInputEvent_name = 1;

const String TestHarnessName =
      'sky::TestHarness';

abstract class TestHarness {
  void onTestComplete(String testResult, List<int> pixels);
  void dispatchInputEvent(input_events_mojom.Event event);

}


class TestHarnessProxyImpl extends bindings.Proxy {
  TestHarnessProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  TestHarnessProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  TestHarnessProxyImpl.unbound() : super.unbound();

  static TestHarnessProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TestHarnessProxyImpl.fromEndpoint(endpoint);

  String get name => TestHarnessName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
}


class _TestHarnessProxyCalls implements TestHarness {
  TestHarnessProxyImpl _proxyImpl;

  _TestHarnessProxyCalls(this._proxyImpl);
    void onTestComplete(String testResult, List<int> pixels) {
      var params = new TestHarnessOnTestCompleteParams();
      params.testResult = testResult;
      params.pixels = pixels;
      _proxyImpl.sendMessage(params, kTestHarness_onTestComplete_name);
    }
  
    void dispatchInputEvent(input_events_mojom.Event event) {
      var params = new TestHarnessDispatchInputEventParams();
      params.event = event;
      _proxyImpl.sendMessage(params, kTestHarness_dispatchInputEvent_name);
    }
  
}


class TestHarnessProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  TestHarness ptr;
  final String name = TestHarnessName;

  TestHarnessProxy(TestHarnessProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _TestHarnessProxyCalls(proxyImpl);

  TestHarnessProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new TestHarnessProxyImpl.fromEndpoint(endpoint) {
    ptr = new _TestHarnessProxyCalls(impl);
  }

  TestHarnessProxy.fromHandle(core.MojoHandle handle) :
      impl = new TestHarnessProxyImpl.fromHandle(handle) {
    ptr = new _TestHarnessProxyCalls(impl);
  }

  TestHarnessProxy.unbound() :
      impl = new TestHarnessProxyImpl.unbound() {
    ptr = new _TestHarnessProxyCalls(impl);
  }

  static TestHarnessProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TestHarnessProxy.fromEndpoint(endpoint);

  void close() => impl.close();
}


class TestHarnessStub extends bindings.Stub {
  TestHarness _delegate = null;

  TestHarnessStub.fromEndpoint(core.MojoMessagePipeEndpoint endpoint) :
      super(endpoint);

  TestHarnessStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  TestHarnessStub.unbound() : super.unbound();

  static TestHarnessStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TestHarnessStub.fromEndpoint(endpoint);

  static const String name = TestHarnessName;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kTestHarness_onTestComplete_name:
        var params = TestHarnessOnTestCompleteParams.deserialize(
            message.payload);
        _delegate.onTestComplete(params.testResult, params.pixels);
        break;
      case kTestHarness_dispatchInputEvent_name:
        var params = TestHarnessDispatchInputEventParams.deserialize(
            message.payload);
        _delegate.dispatchInputEvent(params.event);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  TestHarness get delegate => _delegate;
      set delegate(TestHarness d) {
    assert(_delegate == null);
    _delegate = d;
  }
}


