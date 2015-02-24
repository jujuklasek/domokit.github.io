// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library http_server_factory.mojom;

import 'dart:async';
import 'dart:mojo_bindings' as bindings;
import 'dart:mojo_core' as core;
import 'package:mojo/services/network/public/interfaces/net_address.mojom.dart' as net_address_mojom;
import 'package:services/http_server/public/http_server.mojom.dart' as http_server_mojom;


class HttpServerFactoryCreateHttpServerParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
  Object serverRequest = null;
  net_address_mojom.NetAddress localAddress = null;

  HttpServerFactoryCreateHttpServerParams() : super(kStructSize);

  static HttpServerFactoryCreateHttpServerParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static HttpServerFactoryCreateHttpServerParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    HttpServerFactoryCreateHttpServerParams result = new HttpServerFactoryCreateHttpServerParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 2)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.serverRequest = decoder0.decodeInterfaceRequest(8, false, http_server_mojom.HttpServerStub.newFromEndpoint);
    }
    {
      
      var decoder1 = decoder0.decodePointer(16, true);
      result.localAddress = net_address_mojom.NetAddress.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInterfaceRequest(serverRequest, 8, false);
    
    encoder0.encodeStruct(localAddress, 16, true);
  }
}
const int kHttpServerFactory_createHttpServer_name = 0;

abstract class HttpServerFactory implements core.Listener {
  static const String name = 'http_server::HttpServerFactory';
  HttpServerFactoryStub stub;

  HttpServerFactory(core.MojoMessagePipeEndpoint endpoint) :
      stub = new HttpServerFactoryStub(endpoint);

  HttpServerFactory.fromHandle(core.MojoHandle handle) :
      stub = new HttpServerFactoryStub.fromHandle(handle);

  HttpServerFactory.fromStub(this.stub);

  HttpServerFactory.unbound() :
      stub = new HttpServerFactoryStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  HttpServerFactory get delegate => stub.delegate;
  set delegate(HttpServerFactory d) {
    stub.delegate = d;
  }
  void createHttpServer(Object serverRequest, net_address_mojom.NetAddress localAddress);

}

class HttpServerFactoryProxy extends bindings.Proxy implements HttpServerFactory {
  HttpServerFactoryProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  HttpServerFactoryProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  HttpServerFactoryProxy.unbound() : super.unbound();

  String get name => HttpServerFactory.name;

  static HttpServerFactoryProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new HttpServerFactoryProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
  void createHttpServer(Object serverRequest, net_address_mojom.NetAddress localAddress) {
    var params = new HttpServerFactoryCreateHttpServerParams();
    params.serverRequest = serverRequest;
    params.localAddress = localAddress;
    sendMessage(params, kHttpServerFactory_createHttpServer_name);
  }

}

class HttpServerFactoryStub extends bindings.Stub {
  HttpServerFactory _delegate = null;

  HttpServerFactoryStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  HttpServerFactoryStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  HttpServerFactoryStub.unbound() : super.unbound();

  static HttpServerFactoryStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new HttpServerFactoryStub(endpoint);

  static const String name = HttpServerFactory.name;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kHttpServerFactory_createHttpServer_name:
        var params = HttpServerFactoryCreateHttpServerParams.deserialize(
            message.payload);
        _delegate.createHttpServer(params.serverRequest, params.localAddress);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  HttpServerFactory get delegate => _delegate;
      set delegate(HttpServerFactory d) {
    assert(_delegate == null);
    _delegate = d;
  }
}




