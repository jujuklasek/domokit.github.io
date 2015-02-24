// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library test_harness.mojom;

import 'dart:async';
import 'dart:mojo_bindings' as bindings;
import 'dart:mojo_core' as core;
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

abstract class TestHarness implements core.Listener {
  static const String name = 'sky::TestHarness';
  TestHarnessStub stub;

  TestHarness(core.MojoMessagePipeEndpoint endpoint) :
      stub = new TestHarnessStub(endpoint);

  TestHarness.fromHandle(core.MojoHandle handle) :
      stub = new TestHarnessStub.fromHandle(handle);

  TestHarness.fromStub(this.stub);

  TestHarness.unbound() :
      stub = new TestHarnessStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  TestHarness get delegate => stub.delegate;
  set delegate(TestHarness d) {
    stub.delegate = d;
  }
  void onTestComplete(String testResult, List<int> pixels);
  void dispatchInputEvent(input_events_mojom.Event event);

}

class TestHarnessProxy extends bindings.Proxy implements TestHarness {
  TestHarnessProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  TestHarnessProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  TestHarnessProxy.unbound() : super.unbound();

  String get name => TestHarness.name;

  static TestHarnessProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TestHarnessProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
  void onTestComplete(String testResult, List<int> pixels) {
    var params = new TestHarnessOnTestCompleteParams();
    params.testResult = testResult;
    params.pixels = pixels;
    sendMessage(params, kTestHarness_onTestComplete_name);
  }

  void dispatchInputEvent(input_events_mojom.Event event) {
    var params = new TestHarnessDispatchInputEventParams();
    params.event = event;
    sendMessage(params, kTestHarness_dispatchInputEvent_name);
  }

}

class TestHarnessStub extends bindings.Stub {
  TestHarness _delegate = null;

  TestHarnessStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  TestHarnessStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  TestHarnessStub.unbound() : super.unbound();

  static TestHarnessStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TestHarnessStub(endpoint);

  static const String name = TestHarness.name;



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




