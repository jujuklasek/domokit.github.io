// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library inspector.mojom;

import 'dart:async';
import 'dart:mojo_bindings' as bindings;
import 'dart:mojo_core' as core;


class InspectorServiceInjectParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  InspectorServiceInjectParams() : super(kStructSize);

  static InspectorServiceInjectParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static InspectorServiceInjectParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    InspectorServiceInjectParams result = new InspectorServiceInjectParams();

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
const int kInspectorService_inject_name = 0;

abstract class InspectorService implements core.Listener {
  static const String name = 'sky::InspectorService';
  InspectorServiceStub stub;

  InspectorService(core.MojoMessagePipeEndpoint endpoint) :
      stub = new InspectorServiceStub(endpoint);

  InspectorService.fromHandle(core.MojoHandle handle) :
      stub = new InspectorServiceStub.fromHandle(handle);

  InspectorService.fromStub(this.stub);

  InspectorService.unbound() :
      stub = new InspectorServiceStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  InspectorService get delegate => stub.delegate;
  set delegate(InspectorService d) {
    stub.delegate = d;
  }
  void inject();

}

class InspectorServiceProxy extends bindings.Proxy implements InspectorService {
  InspectorServiceProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  InspectorServiceProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  InspectorServiceProxy.unbound() : super.unbound();

  String get name => InspectorService.name;

  static InspectorServiceProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new InspectorServiceProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
  void inject() {
    var params = new InspectorServiceInjectParams();
    sendMessage(params, kInspectorService_inject_name);
  }

}

class InspectorServiceStub extends bindings.Stub {
  InspectorService _delegate = null;

  InspectorServiceStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  InspectorServiceStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  InspectorServiceStub.unbound() : super.unbound();

  static InspectorServiceStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new InspectorServiceStub(endpoint);

  static const String name = InspectorService.name;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kInspectorService_inject_name:
        var params = InspectorServiceInjectParams.deserialize(
            message.payload);
        _delegate.inject();
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  InspectorService get delegate => _delegate;
      set delegate(InspectorService d) {
    assert(_delegate == null);
    _delegate = d;
  }
}




