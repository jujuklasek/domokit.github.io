// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library network_test_service.mojom;

import 'dart:async';
import 'mojo:bindings' as bindings;
import 'mojo:core' as core;


class NetworkTestServiceGetFileSizeParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  String url = null;

  NetworkTestServiceGetFileSizeParams() : super(kStructSize);

  static NetworkTestServiceGetFileSizeParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static NetworkTestServiceGetFileSizeParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    NetworkTestServiceGetFileSizeParams result = new NetworkTestServiceGetFileSizeParams();

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

class NetworkTestServiceGetFileSizeResponseParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
  bool ok = false;
  int size = 0;

  NetworkTestServiceGetFileSizeResponseParams() : super(kStructSize);

  static NetworkTestServiceGetFileSizeResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static NetworkTestServiceGetFileSizeResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    NetworkTestServiceGetFileSizeResponseParams result = new NetworkTestServiceGetFileSizeResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 2)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.ok = decoder0.decodeBool(8, 0);
    }
    {
      
      result.size = decoder0.decodeUint64(16);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeBool(ok, 8, 0);
    
    encoder0.encodeUint64(size, 16);
  }
}

class NetworkTestServiceQuitParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  NetworkTestServiceQuitParams() : super(kStructSize);

  static NetworkTestServiceQuitParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static NetworkTestServiceQuitParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    NetworkTestServiceQuitParams result = new NetworkTestServiceQuitParams();

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
const int kNetworkTestService_getFileSize_name = 0;
const int kNetworkTestService_quit_name = 1;

abstract class NetworkTestService implements core.Listener {
  static const String name = 'js::NetworkTestService';
  NetworkTestServiceStub stub;

  NetworkTestService(core.MojoMessagePipeEndpoint endpoint) :
      stub = new NetworkTestServiceStub(endpoint);

  NetworkTestService.fromHandle(core.MojoHandle handle) :
      stub = new NetworkTestServiceStub.fromHandle(handle);

  NetworkTestService.fromStub(this.stub);

  NetworkTestService.unbound() :
      stub = new NetworkTestServiceStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen({Function onClosed}) =>
      stub.listen(onClosed: onClosed);

  NetworkTestService get delegate => stub.delegate;
  set delegate(NetworkTestService d) {
    stub.delegate = d;
  }
  Future<NetworkTestServiceGetFileSizeResponseParams> getFileSize(String url,[Function responseFactory = null]);
  void quit();

}

class NetworkTestServiceProxy extends bindings.Proxy implements NetworkTestService {
  NetworkTestServiceProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  NetworkTestServiceProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  NetworkTestServiceProxy.unbound() : super.unbound();

  String get name => NetworkTestService.name;

  static NetworkTestServiceProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new NetworkTestServiceProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kNetworkTestService_getFileSize_name:
        var r = NetworkTestServiceGetFileSizeResponseParams.deserialize(
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
  Future<NetworkTestServiceGetFileSizeResponseParams> getFileSize(String url,[Function responseFactory = null]) {
    var params = new NetworkTestServiceGetFileSizeParams();
    params.url = url;
    return sendMessageWithRequestId(
        params,
        kNetworkTestService_getFileSize_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  void quit() {
    var params = new NetworkTestServiceQuitParams();
    sendMessage(params, kNetworkTestService_quit_name);
  }

}

class NetworkTestServiceStub extends bindings.Stub {
  NetworkTestService _delegate = null;

  NetworkTestServiceStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  NetworkTestServiceStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  NetworkTestServiceStub.unbound() : super.unbound();

  static NetworkTestServiceStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new NetworkTestServiceStub(endpoint);

  static const String name = NetworkTestService.name;


  NetworkTestServiceGetFileSizeResponseParams _NetworkTestServiceGetFileSizeResponseParamsFactory(bool ok, int size) {
    var result = new NetworkTestServiceGetFileSizeResponseParams();
    result.ok = ok;
    result.size = size;
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kNetworkTestService_getFileSize_name:
        var params = NetworkTestServiceGetFileSizeParams.deserialize(
            message.payload);
        return _delegate.getFileSize(params.url,_NetworkTestServiceGetFileSizeResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kNetworkTestService_getFileSize_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kNetworkTestService_quit_name:
        var params = NetworkTestServiceQuitParams.deserialize(
            message.payload);
        _delegate.quit();
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  NetworkTestService get delegate => _delegate;
      set delegate(NetworkTestService d) {
    assert(_delegate == null);
    _delegate = d;
  }
}


