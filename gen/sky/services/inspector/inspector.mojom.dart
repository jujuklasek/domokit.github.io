// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library inspector.mojom;

import 'dart:async';
import 'mojo:bindings' as bindings;
import 'mojo:core' as core;


class InspectorFrontendSendMessageParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  String message = null;

  InspectorFrontendSendMessageParams() : super(kStructSize);

  static InspectorFrontendSendMessageParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static InspectorFrontendSendMessageParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    InspectorFrontendSendMessageParams result = new InspectorFrontendSendMessageParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.message = decoder0.decodeString(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeString(message, 8, false);
  }
}

class InspectorBackendOnConnectParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  InspectorBackendOnConnectParams() : super(kStructSize);

  static InspectorBackendOnConnectParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static InspectorBackendOnConnectParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    InspectorBackendOnConnectParams result = new InspectorBackendOnConnectParams();

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

class InspectorBackendOnDisconnectParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  InspectorBackendOnDisconnectParams() : super(kStructSize);

  static InspectorBackendOnDisconnectParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static InspectorBackendOnDisconnectParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    InspectorBackendOnDisconnectParams result = new InspectorBackendOnDisconnectParams();

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

class InspectorBackendOnMessageParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  String message = null;

  InspectorBackendOnMessageParams() : super(kStructSize);

  static InspectorBackendOnMessageParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static InspectorBackendOnMessageParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    InspectorBackendOnMessageParams result = new InspectorBackendOnMessageParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.message = decoder0.decodeString(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeString(message, 8, false);
  }
}
const int kInspectorFrontend_sendMessage_name = 0;

abstract class InspectorFrontend implements core.Listener {
  static const String name = 'sky::InspectorFrontend';
  InspectorFrontendStub stub;

  InspectorFrontend(core.MojoMessagePipeEndpoint endpoint) :
      stub = new InspectorFrontendStub(endpoint);

  InspectorFrontend.fromHandle(core.MojoHandle handle) :
      stub = new InspectorFrontendStub.fromHandle(handle);

  InspectorFrontend.fromStub(this.stub);

  InspectorFrontend.unbound() :
      stub = new InspectorFrontendStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  InspectorFrontend get delegate => stub.delegate;
  set delegate(InspectorFrontend d) {
    stub.delegate = d;
  }
  void sendMessage(String message);

}

class InspectorFrontendProxy extends bindings.Proxy implements InspectorFrontend {
  InspectorFrontendProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  InspectorFrontendProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  InspectorFrontendProxy.unbound() : super.unbound();

  String get name => InspectorFrontend.name;

  static InspectorFrontendProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new InspectorFrontendProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
  void sendMessage(String message) {
    var params = new InspectorFrontendSendMessageParams();
    params.message = message;
    sendMessage(params, kInspectorFrontend_sendMessage_name);
  }

}

class InspectorFrontendStub extends bindings.Stub {
  InspectorFrontend _delegate = null;

  InspectorFrontendStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  InspectorFrontendStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  InspectorFrontendStub.unbound() : super.unbound();

  static InspectorFrontendStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new InspectorFrontendStub(endpoint);

  static const String name = InspectorFrontend.name;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kInspectorFrontend_sendMessage_name:
        var params = InspectorFrontendSendMessageParams.deserialize(
            message.payload);
        _delegate.sendMessage(params.message);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  InspectorFrontend get delegate => _delegate;
      set delegate(InspectorFrontend d) {
    assert(_delegate == null);
    _delegate = d;
  }
}



const int kInspectorBackend_onConnect_name = 0;
const int kInspectorBackend_onDisconnect_name = 1;
const int kInspectorBackend_onMessage_name = 2;

abstract class InspectorBackend implements core.Listener {
  static const String name = 'sky::InspectorBackend';
  InspectorBackendStub stub;

  InspectorBackend(core.MojoMessagePipeEndpoint endpoint) :
      stub = new InspectorBackendStub(endpoint);

  InspectorBackend.fromHandle(core.MojoHandle handle) :
      stub = new InspectorBackendStub.fromHandle(handle);

  InspectorBackend.fromStub(this.stub);

  InspectorBackend.unbound() :
      stub = new InspectorBackendStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  InspectorBackend get delegate => stub.delegate;
  set delegate(InspectorBackend d) {
    stub.delegate = d;
  }
  void onConnect();
  void onDisconnect();
  void onMessage(String message);

}

class InspectorBackendProxy extends bindings.Proxy implements InspectorBackend {
  InspectorBackendProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  InspectorBackendProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  InspectorBackendProxy.unbound() : super.unbound();

  String get name => InspectorBackend.name;

  static InspectorBackendProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new InspectorBackendProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
  void onConnect() {
    var params = new InspectorBackendOnConnectParams();
    sendMessage(params, kInspectorBackend_onConnect_name);
  }

  void onDisconnect() {
    var params = new InspectorBackendOnDisconnectParams();
    sendMessage(params, kInspectorBackend_onDisconnect_name);
  }

  void onMessage(String message) {
    var params = new InspectorBackendOnMessageParams();
    params.message = message;
    sendMessage(params, kInspectorBackend_onMessage_name);
  }

}

class InspectorBackendStub extends bindings.Stub {
  InspectorBackend _delegate = null;

  InspectorBackendStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  InspectorBackendStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  InspectorBackendStub.unbound() : super.unbound();

  static InspectorBackendStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new InspectorBackendStub(endpoint);

  static const String name = InspectorBackend.name;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kInspectorBackend_onConnect_name:
        var params = InspectorBackendOnConnectParams.deserialize(
            message.payload);
        _delegate.onConnect();
        break;
      case kInspectorBackend_onDisconnect_name:
        var params = InspectorBackendOnDisconnectParams.deserialize(
            message.payload);
        _delegate.onDisconnect();
        break;
      case kInspectorBackend_onMessage_name:
        var params = InspectorBackendOnMessageParams.deserialize(
            message.payload);
        _delegate.onMessage(params.message);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  InspectorBackend get delegate => _delegate;
      set delegate(InspectorBackend d) {
    assert(_delegate == null);
    _delegate = d;
  }
}




