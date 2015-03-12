// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library child.mojom;

import 'dart:async';
import 'dart:mojo.bindings' as bindings;
import 'dart:mojo.core' as core;
import 'package:mojo/services/geometry/public/interfaces/geometry.mojom.dart' as geometry_mojom;
import 'package:mojo/services/surfaces/public/interfaces/quads.mojom.dart' as quads_mojom;
import 'package:mojo/services/surfaces/public/interfaces/surface_id.mojom.dart' as surface_id_mojom;


class ChildProduceFrameParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
  quads_mojom.Color color = null;
  geometry_mojom.Size size = null;

  ChildProduceFrameParams() : super(kStructSize);

  static ChildProduceFrameParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ChildProduceFrameParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ChildProduceFrameParams result = new ChildProduceFrameParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 2)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.color = quads_mojom.Color.decode(decoder1);
    }
    {
      
      var decoder1 = decoder0.decodePointer(16, false);
      result.size = geometry_mojom.Size.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(color, 8, false);
    
    encoder0.encodeStruct(size, 16, false);
  }

  String toString() {
    return "ChildProduceFrameParams("
           "color: $color" ", "
           "size: $size" ")";
  }
}

class ChildProduceFrameResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  surface_id_mojom.SurfaceId id = null;

  ChildProduceFrameResponseParams() : super(kStructSize);

  static ChildProduceFrameResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ChildProduceFrameResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ChildProduceFrameResponseParams result = new ChildProduceFrameResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.id = surface_id_mojom.SurfaceId.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(id, 8, false);
  }

  String toString() {
    return "ChildProduceFrameResponseParams("
           "id: $id" ")";
  }
}
const int kChild_produceFrame_name = 0;

const String ChildName =
      '::Child';

abstract class Child {
  Future<ChildProduceFrameResponseParams> produceFrame(quads_mojom.Color color,geometry_mojom.Size size,[Function responseFactory = null]);

}


class ChildProxyImpl extends bindings.Proxy {
  ChildProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  ChildProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  ChildProxyImpl.unbound() : super.unbound();

  static ChildProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ChildProxyImpl.fromEndpoint(endpoint);

  String get name => ChildName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kChild_produceFrame_name:
        var r = ChildProduceFrameResponseParams.deserialize(
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

  String toString() {
    var superString = super.toString();
    return "ChildProxyImpl($superString)";
  }
}


class _ChildProxyCalls implements Child {
  ChildProxyImpl _proxyImpl;

  _ChildProxyCalls(this._proxyImpl);
    Future<ChildProduceFrameResponseParams> produceFrame(quads_mojom.Color color,geometry_mojom.Size size,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new ChildProduceFrameParams();
      params.color = color;
      params.size = size;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kChild_produceFrame_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
}


class ChildProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  Child ptr;
  final String name = ChildName;

  ChildProxy(ChildProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _ChildProxyCalls(proxyImpl);

  ChildProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new ChildProxyImpl.fromEndpoint(endpoint) {
    ptr = new _ChildProxyCalls(impl);
  }

  ChildProxy.fromHandle(core.MojoHandle handle) :
      impl = new ChildProxyImpl.fromHandle(handle) {
    ptr = new _ChildProxyCalls(impl);
  }

  ChildProxy.unbound() :
      impl = new ChildProxyImpl.unbound() {
    ptr = new _ChildProxyCalls(impl);
  }

  static ChildProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ChildProxy.fromEndpoint(endpoint);

  Future close() => impl.close();

  String toString() {
    return "ChildProxy($impl)";
  }
}


class ChildStub extends bindings.Stub {
  Child _impl = null;

  ChildStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  ChildStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  ChildStub.unbound() : super.unbound();

  static ChildStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ChildStub.fromEndpoint(endpoint);

  static const String name = ChildName;


  ChildProduceFrameResponseParams _ChildProduceFrameResponseParamsFactory(surface_id_mojom.SurfaceId id) {
    var result = new ChildProduceFrameResponseParams();
    result.id = id;
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_impl != null);
    switch (message.header.type) {
      case kChild_produceFrame_name:
        var params = ChildProduceFrameParams.deserialize(
            message.payload);
        return _impl.produceFrame(params.color,params.size,_ChildProduceFrameResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kChild_produceFrame_name,
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

  Child get impl => _impl;
      set impl(Child d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "ChildStub($superString)";
  }
}


