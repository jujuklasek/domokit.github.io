// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library gpu.mojom;

import 'dart:async';
import 'dart:mojo_bindings' as bindings;
import 'dart:mojo_core' as core;
import 'package:mojo/services/geometry/public/interfaces/geometry.mojom.dart' as geometry_mojom;
import 'package:mojo/services/gpu/public/interfaces/command_buffer.mojom.dart' as command_buffer_mojom;
import 'package:mojo/services/gpu/public/interfaces/viewport_parameter_listener.mojom.dart' as viewport_parameter_listener_mojom;


class GpuCreateOnscreenGleS2ContextParams extends bindings.Struct {
  static const int kStructSize = 32;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 4);
  int nativeViewportId = 0;
  geometry_mojom.Size size = null;
  Object gles2Client = null;
  Object listener = null;

  GpuCreateOnscreenGleS2ContextParams() : super(kStructSize);

  static GpuCreateOnscreenGleS2ContextParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static GpuCreateOnscreenGleS2ContextParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    GpuCreateOnscreenGleS2ContextParams result = new GpuCreateOnscreenGleS2ContextParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 4)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.nativeViewportId = decoder0.decodeUint64(8);
    }
    {
      
      var decoder1 = decoder0.decodePointer(16, false);
      result.size = geometry_mojom.Size.decode(decoder1);
    }
    {
      
      result.gles2Client = decoder0.decodeInterfaceRequest(24, false, command_buffer_mojom.CommandBufferStub.newFromEndpoint);
    }
    {
      
      result.listener = decoder0.decodeServiceInterface(28, true, viewport_parameter_listener_mojom.ViewportParameterListenerProxy.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint64(nativeViewportId, 8);
    
    encoder0.encodeStruct(size, 16, false);
    
    encoder0.encodeInterfaceRequest(gles2Client, 24, false);
    
    encoder0.encodeInterface(listener, 28, true);
  }
}

class GpuCreateOffscreenGleS2ContextParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  Object gles2Client = null;

  GpuCreateOffscreenGleS2ContextParams() : super(kStructSize);

  static GpuCreateOffscreenGleS2ContextParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static GpuCreateOffscreenGleS2ContextParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    GpuCreateOffscreenGleS2ContextParams result = new GpuCreateOffscreenGleS2ContextParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.gles2Client = decoder0.decodeInterfaceRequest(8, false, command_buffer_mojom.CommandBufferStub.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInterfaceRequest(gles2Client, 8, false);
  }
}
const int kGpu_createOnscreenGleS2Context_name = 0;
const int kGpu_createOffscreenGleS2Context_name = 1;

abstract class Gpu implements core.Listener {
  static const String name = 'mojo::Gpu';
  GpuStub stub;

  Gpu(core.MojoMessagePipeEndpoint endpoint) :
      stub = new GpuStub(endpoint);

  Gpu.fromHandle(core.MojoHandle handle) :
      stub = new GpuStub.fromHandle(handle);

  Gpu.fromStub(this.stub);

  Gpu.unbound() :
      stub = new GpuStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  Gpu get delegate => stub.delegate;
  set delegate(Gpu d) {
    stub.delegate = d;
  }
  void createOnscreenGleS2Context(int nativeViewportId, geometry_mojom.Size size, Object gles2Client, Object listener);
  void createOffscreenGleS2Context(Object gles2Client);

}

class GpuProxy extends bindings.Proxy implements Gpu {
  GpuProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  GpuProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  GpuProxy.unbound() : super.unbound();

  String get name => Gpu.name;

  static GpuProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new GpuProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
  void createOnscreenGleS2Context(int nativeViewportId, geometry_mojom.Size size, Object gles2Client, Object listener) {
    var params = new GpuCreateOnscreenGleS2ContextParams();
    params.nativeViewportId = nativeViewportId;
    params.size = size;
    params.gles2Client = gles2Client;
    params.listener = listener;
    sendMessage(params, kGpu_createOnscreenGleS2Context_name);
  }

  void createOffscreenGleS2Context(Object gles2Client) {
    var params = new GpuCreateOffscreenGleS2ContextParams();
    params.gles2Client = gles2Client;
    sendMessage(params, kGpu_createOffscreenGleS2Context_name);
  }

}

class GpuStub extends bindings.Stub {
  Gpu _delegate = null;

  GpuStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  GpuStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  GpuStub.unbound() : super.unbound();

  static GpuStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new GpuStub(endpoint);

  static const String name = Gpu.name;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kGpu_createOnscreenGleS2Context_name:
        var params = GpuCreateOnscreenGleS2ContextParams.deserialize(
            message.payload);
        _delegate.createOnscreenGleS2Context(params.nativeViewportId, params.size, params.gles2Client, params.listener);
        break;
      case kGpu_createOffscreenGleS2Context_name:
        var params = GpuCreateOffscreenGleS2ContextParams.deserialize(
            message.payload);
        _delegate.createOffscreenGleS2Context(params.gles2Client);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  Gpu get delegate => _delegate;
      set delegate(Gpu d) {
    assert(_delegate == null);
    _delegate = d;
  }
}



