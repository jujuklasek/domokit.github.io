// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library service_provider.mojom;

import 'dart:async';
import 'dart:mojo_bindings' as bindings;
import 'dart:mojo_core' as core;


class ServiceProviderConnectToServiceParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
  String interfaceName = null;
  core.MojoMessagePipeEndpoint pipe = null;

  ServiceProviderConnectToServiceParams() : super(kStructSize);

  static ServiceProviderConnectToServiceParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ServiceProviderConnectToServiceParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ServiceProviderConnectToServiceParams result = new ServiceProviderConnectToServiceParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 2)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.interfaceName = decoder0.decodeString(8, false);
    }
    {
      
      result.pipe = decoder0.decodeMessagePipeHandle(16, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeString(interfaceName, 8, false);
    
    encoder0.encodeMessagePipeHandle(pipe, 16, false);
  }
}
const int kServiceProvider_connectToService_name = 0;

abstract class ServiceProvider implements core.Listener {
  static const String name = 'mojo::ServiceProvider';
  ServiceProviderStub stub;

  ServiceProvider(core.MojoMessagePipeEndpoint endpoint) :
      stub = new ServiceProviderStub(endpoint);

  ServiceProvider.fromHandle(core.MojoHandle handle) :
      stub = new ServiceProviderStub.fromHandle(handle);

  ServiceProvider.fromStub(this.stub);

  ServiceProvider.unbound() :
      stub = new ServiceProviderStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  ServiceProvider get delegate => stub.delegate;
  set delegate(ServiceProvider d) {
    stub.delegate = d;
  }
  void connectToService(String interfaceName, core.MojoMessagePipeEndpoint pipe);

}

class ServiceProviderProxy extends bindings.Proxy implements ServiceProvider {
  ServiceProviderProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  ServiceProviderProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  ServiceProviderProxy.unbound() : super.unbound();

  String get name => ServiceProvider.name;

  static ServiceProviderProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ServiceProviderProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
  void connectToService(String interfaceName, core.MojoMessagePipeEndpoint pipe) {
    var params = new ServiceProviderConnectToServiceParams();
    params.interfaceName = interfaceName;
    params.pipe = pipe;
    sendMessage(params, kServiceProvider_connectToService_name);
  }

}

class ServiceProviderStub extends bindings.Stub {
  ServiceProvider _delegate = null;

  ServiceProviderStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  ServiceProviderStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  ServiceProviderStub.unbound() : super.unbound();

  static ServiceProviderStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ServiceProviderStub(endpoint);

  static const String name = ServiceProvider.name;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kServiceProvider_connectToService_name:
        var params = ServiceProviderConnectToServiceParams.deserialize(
            message.payload);
        _delegate.connectToService(params.interfaceName, params.pipe);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  ServiceProvider get delegate => _delegate;
      set delegate(ServiceProvider d) {
    assert(_delegate == null);
    _delegate = d;
  }
}




