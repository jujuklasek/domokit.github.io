// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library icu_data.mojom;

import 'dart:async';
import 'dart:mojo_bindings' as bindings;
import 'dart:mojo_core' as core;


class IcuDataMapParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  String sha1hash = null;

  IcuDataMapParams() : super(kStructSize);

  static IcuDataMapParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static IcuDataMapParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    IcuDataMapParams result = new IcuDataMapParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.sha1hash = decoder0.decodeString(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeString(sha1hash, 8, false);
  }
}

class IcuDataMapResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  core.MojoSharedBuffer icuData = null;

  IcuDataMapResponseParams() : super(kStructSize);

  static IcuDataMapResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static IcuDataMapResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    IcuDataMapResponseParams result = new IcuDataMapResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.icuData = decoder0.decodeSharedBufferHandle(8, true);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeSharedBufferHandle(icuData, 8, true);
  }
}
const int kIcuData_map_name = 0;

abstract class IcuData implements core.Listener {
  static const String name = 'icu_data::IcuData';
  IcuDataStub stub;

  IcuData(core.MojoMessagePipeEndpoint endpoint) :
      stub = new IcuDataStub(endpoint);

  IcuData.fromHandle(core.MojoHandle handle) :
      stub = new IcuDataStub.fromHandle(handle);

  IcuData.fromStub(this.stub);

  IcuData.unbound() :
      stub = new IcuDataStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  IcuData get delegate => stub.delegate;
  set delegate(IcuData d) {
    stub.delegate = d;
  }
  Future<IcuDataMapResponseParams> map(String sha1hash,[Function responseFactory = null]);

}

class IcuDataProxy extends bindings.Proxy implements IcuData {
  IcuDataProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  IcuDataProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  IcuDataProxy.unbound() : super.unbound();

  String get name => IcuData.name;

  static IcuDataProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new IcuDataProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kIcuData_map_name:
        var r = IcuDataMapResponseParams.deserialize(
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
  Future<IcuDataMapResponseParams> map(String sha1hash,[Function responseFactory = null]) {
    var params = new IcuDataMapParams();
    params.sha1hash = sha1hash;
    return sendMessageWithRequestId(
        params,
        kIcuData_map_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
}

class IcuDataStub extends bindings.Stub {
  IcuData _delegate = null;

  IcuDataStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  IcuDataStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  IcuDataStub.unbound() : super.unbound();

  static IcuDataStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new IcuDataStub(endpoint);

  static const String name = IcuData.name;


  IcuDataMapResponseParams _IcuDataMapResponseParamsFactory(core.MojoSharedBuffer icuData) {
    var result = new IcuDataMapResponseParams();
    result.icuData = icuData;
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kIcuData_map_name:
        var params = IcuDataMapParams.deserialize(
            message.payload);
        return _delegate.map(params.sha1hash,_IcuDataMapResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kIcuData_map_name,
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

  IcuData get delegate => _delegate;
      set delegate(IcuData d) {
    assert(_delegate == null);
    _delegate = d;
  }
}




