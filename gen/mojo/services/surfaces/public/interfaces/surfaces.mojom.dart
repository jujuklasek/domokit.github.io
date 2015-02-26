// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library surfaces.mojom;

import 'dart:async';
import 'mojo:bindings' as bindings;
import 'mojo:core' as core;
import 'package:mojo/services/geometry/public/interfaces/geometry.mojom.dart' as geometry_mojom;
import 'package:mojo/services/gpu/public/interfaces/command_buffer.mojom.dart' as command_buffer_mojom;
import 'package:mojo/services/gpu/public/interfaces/viewport_parameter_listener.mojom.dart' as viewport_parameter_listener_mojom;
import 'package:mojo/services/surfaces/public/interfaces/quads.mojom.dart' as quads_mojom;
import 'package:mojo/services/surfaces/public/interfaces/surface_id.mojom.dart' as surface_id_mojom;

final int ResourceFormat_RGBA_8888 = 0;
final int ResourceFormat_RGBA_4444 = ResourceFormat_RGBA_8888 + 1;
final int ResourceFormat_BGRA_8888 = ResourceFormat_RGBA_4444 + 1;
final int ResourceFormat_ALPHA_8 = ResourceFormat_BGRA_8888 + 1;
final int ResourceFormat_LUMINANCE_8 = ResourceFormat_ALPHA_8 + 1;
final int ResourceFormat_RGB_565 = ResourceFormat_LUMINANCE_8 + 1;
final int ResourceFormat_ETC1 = ResourceFormat_RGB_565 + 1;


class Mailbox extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  List<int> name = null;

  Mailbox() : super(kStructSize);

  static Mailbox deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static Mailbox decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    Mailbox result = new Mailbox();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.name = decoder0.decodeInt8Array(8, bindings.kNothingNullable, 64);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInt8Array(name, 8, bindings.kNothingNullable, 64);
  }
}

class MailboxHolder extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 3);
  Mailbox mailbox = null;
  int textureTarget = 0;
  int syncPoint = 0;

  MailboxHolder() : super(kStructSize);

  static MailboxHolder deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static MailboxHolder decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    MailboxHolder result = new MailboxHolder();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 3)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.mailbox = Mailbox.decode(decoder1);
    }
    {
      
      result.textureTarget = decoder0.decodeUint32(16);
    }
    {
      
      result.syncPoint = decoder0.decodeUint32(20);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(mailbox, 8, false);
    
    encoder0.encodeUint32(textureTarget, 16);
    
    encoder0.encodeUint32(syncPoint, 20);
  }
}

class TransferableResource extends bindings.Struct {
  static const int kStructSize = 40;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 7);
  int id = 0;
  int format = 0;
  int filter = 0;
  bool isRepeated = false;
  bool isSoftware = false;
  geometry_mojom.Size size = null;
  MailboxHolder mailboxHolder = null;

  TransferableResource() : super(kStructSize);

  static TransferableResource deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TransferableResource decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TransferableResource result = new TransferableResource();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 7)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.id = decoder0.decodeUint32(8);
    }
    {
      
      result.format = decoder0.decodeInt32(12);
    }
    {
      
      result.filter = decoder0.decodeUint32(16);
    }
    {
      
      result.isRepeated = decoder0.decodeBool(20, 0);
    }
    {
      
      result.isSoftware = decoder0.decodeBool(20, 1);
    }
    {
      
      var decoder1 = decoder0.decodePointer(24, false);
      result.size = geometry_mojom.Size.decode(decoder1);
    }
    {
      
      var decoder1 = decoder0.decodePointer(32, false);
      result.mailboxHolder = MailboxHolder.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint32(id, 8);
    
    encoder0.encodeInt32(format, 12);
    
    encoder0.encodeUint32(filter, 16);
    
    encoder0.encodeBool(isRepeated, 20, 0);
    
    encoder0.encodeBool(isSoftware, 20, 1);
    
    encoder0.encodeStruct(size, 24, false);
    
    encoder0.encodeStruct(mailboxHolder, 32, false);
  }
}

class ReturnedResource extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 4);
  int id = 0;
  int syncPoint = 0;
  int count = 0;
  bool lost = false;

  ReturnedResource() : super(kStructSize);

  static ReturnedResource deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ReturnedResource decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ReturnedResource result = new ReturnedResource();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 4)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.id = decoder0.decodeUint32(8);
    }
    {
      
      result.syncPoint = decoder0.decodeUint32(12);
    }
    {
      
      result.count = decoder0.decodeInt32(16);
    }
    {
      
      result.lost = decoder0.decodeBool(20, 0);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint32(id, 8);
    
    encoder0.encodeUint32(syncPoint, 12);
    
    encoder0.encodeInt32(count, 16);
    
    encoder0.encodeBool(lost, 20, 0);
  }
}

class Frame extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
  List<TransferableResource> resources = null;
  List<quads_mojom.Pass> passes = null;

  Frame() : super(kStructSize);

  static Frame deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static Frame decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    Frame result = new Frame();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 2)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      {
        var si1 = decoder1.decodeDataHeaderForPointerArray(bindings.kUnspecifiedArrayLength);
        result.resources = new List<TransferableResource>(si1.numElements);
        for (int i1 = 0; i1 < si1.numElements; ++i1) {
          
          var decoder2 = decoder1.decodePointer(bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i1, false);
          result.resources[i1] = TransferableResource.decode(decoder2);
        }
      }
    }
    {
      
      var decoder1 = decoder0.decodePointer(16, false);
      {
        var si1 = decoder1.decodeDataHeaderForPointerArray(bindings.kUnspecifiedArrayLength);
        result.passes = new List<quads_mojom.Pass>(si1.numElements);
        for (int i1 = 0; i1 < si1.numElements; ++i1) {
          
          var decoder2 = decoder1.decodePointer(bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i1, false);
          result.passes[i1] = quads_mojom.Pass.decode(decoder2);
        }
      }
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    if (resources == null) {
      encoder0.encodeNullPointer(8, false);
    } else {
      var encoder1 = encoder0.encodePointerArray(resources.length, 8, bindings.kUnspecifiedArrayLength);
      for (int i0 = 0; i0 < resources.length; ++i0) {
        
        encoder1.encodeStruct(resources[i0], bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i0, false);
      }
    }
    
    if (passes == null) {
      encoder0.encodeNullPointer(16, false);
    } else {
      var encoder1 = encoder0.encodePointerArray(passes.length, 16, bindings.kUnspecifiedArrayLength);
      for (int i0 = 0; i0 < passes.length; ++i0) {
        
        encoder1.encodeStruct(passes[i0], bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i0, false);
      }
    }
  }
}

class ResourceReturnerReturnResourcesParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  List<ReturnedResource> resources = null;

  ResourceReturnerReturnResourcesParams() : super(kStructSize);

  static ResourceReturnerReturnResourcesParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ResourceReturnerReturnResourcesParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ResourceReturnerReturnResourcesParams result = new ResourceReturnerReturnResourcesParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      {
        var si1 = decoder1.decodeDataHeaderForPointerArray(bindings.kUnspecifiedArrayLength);
        result.resources = new List<ReturnedResource>(si1.numElements);
        for (int i1 = 0; i1 < si1.numElements; ++i1) {
          
          var decoder2 = decoder1.decodePointer(bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i1, false);
          result.resources[i1] = ReturnedResource.decode(decoder2);
        }
      }
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    if (resources == null) {
      encoder0.encodeNullPointer(8, false);
    } else {
      var encoder1 = encoder0.encodePointerArray(resources.length, 8, bindings.kUnspecifiedArrayLength);
      for (int i0 = 0; i0 < resources.length; ++i0) {
        
        encoder1.encodeStruct(resources[i0], bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i0, false);
      }
    }
  }
}

class SurfaceGetIdNamespaceParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  SurfaceGetIdNamespaceParams() : super(kStructSize);

  static SurfaceGetIdNamespaceParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static SurfaceGetIdNamespaceParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SurfaceGetIdNamespaceParams result = new SurfaceGetIdNamespaceParams();

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

class SurfaceGetIdNamespaceResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  int idNamespace = 0;

  SurfaceGetIdNamespaceResponseParams() : super(kStructSize);

  static SurfaceGetIdNamespaceResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static SurfaceGetIdNamespaceResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SurfaceGetIdNamespaceResponseParams result = new SurfaceGetIdNamespaceResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.idNamespace = decoder0.decodeUint32(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint32(idNamespace, 8);
  }
}

class SurfaceSetResourceReturnerParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  Object returner = null;

  SurfaceSetResourceReturnerParams() : super(kStructSize);

  static SurfaceSetResourceReturnerParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static SurfaceSetResourceReturnerParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SurfaceSetResourceReturnerParams result = new SurfaceSetResourceReturnerParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.returner = decoder0.decodeServiceInterface(8, false, ResourceReturnerProxy.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInterface(returner, 8, false);
  }
}

class SurfaceCreateSurfaceParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  int idLocal = 0;

  SurfaceCreateSurfaceParams() : super(kStructSize);

  static SurfaceCreateSurfaceParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static SurfaceCreateSurfaceParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SurfaceCreateSurfaceParams result = new SurfaceCreateSurfaceParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.idLocal = decoder0.decodeUint32(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint32(idLocal, 8);
  }
}

class SurfaceSubmitFrameParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
  int idLocal = 0;
  Frame frame = null;

  SurfaceSubmitFrameParams() : super(kStructSize);

  static SurfaceSubmitFrameParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static SurfaceSubmitFrameParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SurfaceSubmitFrameParams result = new SurfaceSubmitFrameParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 2)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.idLocal = decoder0.decodeUint32(8);
    }
    {
      
      var decoder1 = decoder0.decodePointer(16, false);
      result.frame = Frame.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint32(idLocal, 8);
    
    encoder0.encodeStruct(frame, 16, false);
  }
}

class SurfaceSubmitFrameResponseParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  SurfaceSubmitFrameResponseParams() : super(kStructSize);

  static SurfaceSubmitFrameResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static SurfaceSubmitFrameResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SurfaceSubmitFrameResponseParams result = new SurfaceSubmitFrameResponseParams();

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

class SurfaceDestroySurfaceParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  int idLocal = 0;

  SurfaceDestroySurfaceParams() : super(kStructSize);

  static SurfaceDestroySurfaceParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static SurfaceDestroySurfaceParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SurfaceDestroySurfaceParams result = new SurfaceDestroySurfaceParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.idLocal = decoder0.decodeUint32(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint32(idLocal, 8);
  }
}

class SurfaceCreateGleS2BoundSurfaceParams extends bindings.Struct {
  static const int kStructSize = 32;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 4);
  Object gles2Client = null;
  int idLocal = 0;
  geometry_mojom.Size size = null;
  Object listener = null;

  SurfaceCreateGleS2BoundSurfaceParams() : super(kStructSize);

  static SurfaceCreateGleS2BoundSurfaceParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static SurfaceCreateGleS2BoundSurfaceParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SurfaceCreateGleS2BoundSurfaceParams result = new SurfaceCreateGleS2BoundSurfaceParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 4)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.gles2Client = decoder0.decodeServiceInterface(8, false, command_buffer_mojom.CommandBufferProxy.newFromEndpoint);
    }
    {
      
      result.idLocal = decoder0.decodeUint32(12);
    }
    {
      
      var decoder1 = decoder0.decodePointer(16, false);
      result.size = geometry_mojom.Size.decode(decoder1);
    }
    {
      
      result.listener = decoder0.decodeInterfaceRequest(24, false, viewport_parameter_listener_mojom.ViewportParameterListenerStub.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInterface(gles2Client, 8, false);
    
    encoder0.encodeUint32(idLocal, 12);
    
    encoder0.encodeStruct(size, 16, false);
    
    encoder0.encodeInterfaceRequest(listener, 24, false);
  }
}
const int kResourceReturner_returnResources_name = 0;

abstract class ResourceReturner implements core.Listener {
  static const String name = 'mojo::ResourceReturner';
  ResourceReturnerStub stub;

  ResourceReturner(core.MojoMessagePipeEndpoint endpoint) :
      stub = new ResourceReturnerStub(endpoint);

  ResourceReturner.fromHandle(core.MojoHandle handle) :
      stub = new ResourceReturnerStub.fromHandle(handle);

  ResourceReturner.fromStub(this.stub);

  ResourceReturner.unbound() :
      stub = new ResourceReturnerStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  ResourceReturner get delegate => stub.delegate;
  set delegate(ResourceReturner d) {
    stub.delegate = d;
  }
  void returnResources(List<ReturnedResource> resources);

}

class ResourceReturnerProxy extends bindings.Proxy implements ResourceReturner {
  ResourceReturnerProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  ResourceReturnerProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  ResourceReturnerProxy.unbound() : super.unbound();

  String get name => ResourceReturner.name;

  static ResourceReturnerProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ResourceReturnerProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
  void returnResources(List<ReturnedResource> resources) {
    var params = new ResourceReturnerReturnResourcesParams();
    params.resources = resources;
    sendMessage(params, kResourceReturner_returnResources_name);
  }

}

class ResourceReturnerStub extends bindings.Stub {
  ResourceReturner _delegate = null;

  ResourceReturnerStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  ResourceReturnerStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  ResourceReturnerStub.unbound() : super.unbound();

  static ResourceReturnerStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ResourceReturnerStub(endpoint);

  static const String name = ResourceReturner.name;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kResourceReturner_returnResources_name:
        var params = ResourceReturnerReturnResourcesParams.deserialize(
            message.payload);
        _delegate.returnResources(params.resources);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  ResourceReturner get delegate => _delegate;
      set delegate(ResourceReturner d) {
    assert(_delegate == null);
    _delegate = d;
  }
}



const int kSurface_getIdNamespace_name = 0;
const int kSurface_setResourceReturner_name = 1;
const int kSurface_createSurface_name = 2;
const int kSurface_submitFrame_name = 3;
const int kSurface_destroySurface_name = 4;
const int kSurface_createGleS2BoundSurface_name = 5;

abstract class Surface implements core.Listener {
  static const String name = 'mojo::Surface';
  SurfaceStub stub;

  Surface(core.MojoMessagePipeEndpoint endpoint) :
      stub = new SurfaceStub(endpoint);

  Surface.fromHandle(core.MojoHandle handle) :
      stub = new SurfaceStub.fromHandle(handle);

  Surface.fromStub(this.stub);

  Surface.unbound() :
      stub = new SurfaceStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  Surface get delegate => stub.delegate;
  set delegate(Surface d) {
    stub.delegate = d;
  }
  Future<SurfaceGetIdNamespaceResponseParams> getIdNamespace([Function responseFactory = null]);
  void setResourceReturner(Object returner);
  void createSurface(int idLocal);
  Future<SurfaceSubmitFrameResponseParams> submitFrame(int idLocal,Frame frame,[Function responseFactory = null]);
  void destroySurface(int idLocal);
  void createGleS2BoundSurface(Object gles2Client, int idLocal, geometry_mojom.Size size, Object listener);

}

class SurfaceProxy extends bindings.Proxy implements Surface {
  SurfaceProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  SurfaceProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  SurfaceProxy.unbound() : super.unbound();

  String get name => Surface.name;

  static SurfaceProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new SurfaceProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kSurface_getIdNamespace_name:
        var r = SurfaceGetIdNamespaceResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      case kSurface_submitFrame_name:
        var r = SurfaceSubmitFrameResponseParams.deserialize(
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
  Future<SurfaceGetIdNamespaceResponseParams> getIdNamespace([Function responseFactory = null]) {
    var params = new SurfaceGetIdNamespaceParams();
    return sendMessageWithRequestId(
        params,
        kSurface_getIdNamespace_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  void setResourceReturner(Object returner) {
    var params = new SurfaceSetResourceReturnerParams();
    params.returner = returner;
    sendMessage(params, kSurface_setResourceReturner_name);
  }

  void createSurface(int idLocal) {
    var params = new SurfaceCreateSurfaceParams();
    params.idLocal = idLocal;
    sendMessage(params, kSurface_createSurface_name);
  }

  Future<SurfaceSubmitFrameResponseParams> submitFrame(int idLocal,Frame frame,[Function responseFactory = null]) {
    var params = new SurfaceSubmitFrameParams();
    params.idLocal = idLocal;
    params.frame = frame;
    return sendMessageWithRequestId(
        params,
        kSurface_submitFrame_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  void destroySurface(int idLocal) {
    var params = new SurfaceDestroySurfaceParams();
    params.idLocal = idLocal;
    sendMessage(params, kSurface_destroySurface_name);
  }

  void createGleS2BoundSurface(Object gles2Client, int idLocal, geometry_mojom.Size size, Object listener) {
    var params = new SurfaceCreateGleS2BoundSurfaceParams();
    params.gles2Client = gles2Client;
    params.idLocal = idLocal;
    params.size = size;
    params.listener = listener;
    sendMessage(params, kSurface_createGleS2BoundSurface_name);
  }

}

class SurfaceStub extends bindings.Stub {
  Surface _delegate = null;

  SurfaceStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  SurfaceStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  SurfaceStub.unbound() : super.unbound();

  static SurfaceStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new SurfaceStub(endpoint);

  static const String name = Surface.name;


  SurfaceGetIdNamespaceResponseParams _SurfaceGetIdNamespaceResponseParamsFactory(int idNamespace) {
    var result = new SurfaceGetIdNamespaceResponseParams();
    result.idNamespace = idNamespace;
    return result;
  }
  SurfaceSubmitFrameResponseParams _SurfaceSubmitFrameResponseParamsFactory() {
    var result = new SurfaceSubmitFrameResponseParams();
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kSurface_getIdNamespace_name:
        var params = SurfaceGetIdNamespaceParams.deserialize(
            message.payload);
        return _delegate.getIdNamespace(_SurfaceGetIdNamespaceResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kSurface_getIdNamespace_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kSurface_setResourceReturner_name:
        var params = SurfaceSetResourceReturnerParams.deserialize(
            message.payload);
        _delegate.setResourceReturner(params.returner);
        break;
      case kSurface_createSurface_name:
        var params = SurfaceCreateSurfaceParams.deserialize(
            message.payload);
        _delegate.createSurface(params.idLocal);
        break;
      case kSurface_submitFrame_name:
        var params = SurfaceSubmitFrameParams.deserialize(
            message.payload);
        return _delegate.submitFrame(params.idLocal,params.frame,_SurfaceSubmitFrameResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kSurface_submitFrame_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kSurface_destroySurface_name:
        var params = SurfaceDestroySurfaceParams.deserialize(
            message.payload);
        _delegate.destroySurface(params.idLocal);
        break;
      case kSurface_createGleS2BoundSurface_name:
        var params = SurfaceCreateGleS2BoundSurfaceParams.deserialize(
            message.payload);
        _delegate.createGleS2BoundSurface(params.gles2Client, params.idLocal, params.size, params.listener);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  Surface get delegate => _delegate;
      set delegate(Surface d) {
    assert(_delegate == null);
    _delegate = d;
  }
}




