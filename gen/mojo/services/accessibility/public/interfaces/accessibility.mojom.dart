// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library accessibility.mojom;

import 'dart:async';
import 'dart:mojo_bindings' as bindings;
import 'dart:mojo_core' as core;
import 'package:mojo/services/geometry/public/interfaces/geometry.mojom.dart' as geometry_mojom;


class AxNode extends bindings.Struct {
  static const int kStructSize = 48;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 6);
  int id = 0;
  int parentId = 0;
  int nextSiblingId = 0;
  geometry_mojom.Rect bounds = null;
  AxLink link = null;
  AxText text = null;

  AxNode() : super(kStructSize);

  static AxNode deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static AxNode decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    AxNode result = new AxNode();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 6)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.id = decoder0.decodeUint32(8);
    }
    {
      
      result.parentId = decoder0.decodeUint32(12);
    }
    {
      
      result.nextSiblingId = decoder0.decodeUint32(16);
    }
    {
      
      var decoder1 = decoder0.decodePointer(24, false);
      result.bounds = geometry_mojom.Rect.decode(decoder1);
    }
    {
      
      var decoder1 = decoder0.decodePointer(32, true);
      result.link = AxLink.decode(decoder1);
    }
    {
      
      var decoder1 = decoder0.decodePointer(40, true);
      result.text = AxText.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint32(id, 8);
    
    encoder0.encodeUint32(parentId, 12);
    
    encoder0.encodeUint32(nextSiblingId, 16);
    
    encoder0.encodeStruct(bounds, 24, false);
    
    encoder0.encodeStruct(link, 32, true);
    
    encoder0.encodeStruct(text, 40, true);
  }
}

class AxLink extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  String url = null;

  AxLink() : super(kStructSize);

  static AxLink deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static AxLink decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    AxLink result = new AxLink();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.url = decoder0.decodeString(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeString(url, 8, false);
  }
}

class AxText extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  String content = null;

  AxText() : super(kStructSize);

  static AxText deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static AxText decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    AxText result = new AxText();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.content = decoder0.decodeString(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeString(content, 8, false);
  }
}

class AxProviderGetTreeParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  AxProviderGetTreeParams() : super(kStructSize);

  static AxProviderGetTreeParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static AxProviderGetTreeParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    AxProviderGetTreeParams result = new AxProviderGetTreeParams();

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

class AxProviderGetTreeResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  List<AxNode> nodes = null;

  AxProviderGetTreeResponseParams() : super(kStructSize);

  static AxProviderGetTreeResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static AxProviderGetTreeResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    AxProviderGetTreeResponseParams result = new AxProviderGetTreeResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      {
        var si1 = decoder1.decodeDataHeaderForPointerArray(bindings.kUnspecifiedArrayLength);
        result.nodes = new List<AxNode>(si1.numElements);
        for (int i1 = 0; i1 < si1.numElements; ++i1) {
          
          var decoder2 = decoder1.decodePointer(bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i1, false);
          result.nodes[i1] = AxNode.decode(decoder2);
        }
      }
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    if (nodes == null) {
      encoder0.encodeNullPointer(8, false);
    } else {
      var encoder1 = encoder0.encodePointerArray(nodes.length, 8, bindings.kUnspecifiedArrayLength);
      for (int i0 = 0; i0 < nodes.length; ++i0) {
        
        encoder1.encodeStruct(nodes[i0], bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i0, false);
      }
    }
  }
}
const int kAxProvider_getTree_name = 0;

abstract class AxProvider implements core.Listener {
  static const String name = 'mojo::AxProvider';
  AxProviderStub stub;

  AxProvider(core.MojoMessagePipeEndpoint endpoint) :
      stub = new AxProviderStub(endpoint);

  AxProvider.fromHandle(core.MojoHandle handle) :
      stub = new AxProviderStub.fromHandle(handle);

  AxProvider.fromStub(this.stub);

  AxProvider.unbound() :
      stub = new AxProviderStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  AxProvider get delegate => stub.delegate;
  set delegate(AxProvider d) {
    stub.delegate = d;
  }
  Future<AxProviderGetTreeResponseParams> getTree([Function responseFactory = null]);

}

class AxProviderProxy extends bindings.Proxy implements AxProvider {
  AxProviderProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  AxProviderProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  AxProviderProxy.unbound() : super.unbound();

  String get name => AxProvider.name;

  static AxProviderProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new AxProviderProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kAxProvider_getTree_name:
        var r = AxProviderGetTreeResponseParams.deserialize(
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
  Future<AxProviderGetTreeResponseParams> getTree([Function responseFactory = null]) {
    var params = new AxProviderGetTreeParams();
    return sendMessageWithRequestId(
        params,
        kAxProvider_getTree_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
}

class AxProviderStub extends bindings.Stub {
  AxProvider _delegate = null;

  AxProviderStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  AxProviderStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  AxProviderStub.unbound() : super.unbound();

  static AxProviderStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new AxProviderStub(endpoint);

  static const String name = AxProvider.name;


  AxProviderGetTreeResponseParams _AxProviderGetTreeResponseParamsFactory(List<AxNode> nodes) {
    var result = new AxProviderGetTreeResponseParams();
    result.nodes = nodes;
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kAxProvider_getTree_name:
        var params = AxProviderGetTreeParams.deserialize(
            message.payload);
        return _delegate.getTree(_AxProviderGetTreeResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kAxProvider_getTree_name,
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

  AxProvider get delegate => _delegate;
      set delegate(AxProvider d) {
    assert(_delegate == null);
    _delegate = d;
  }
}




