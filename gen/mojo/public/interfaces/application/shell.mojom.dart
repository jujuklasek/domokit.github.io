// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library shell.mojom;

import 'dart:async';
import 'mojo:bindings' as bindings;
import 'mojo:core' as core;
import 'package:mojo/public/interfaces/application/service_provider.mojom.dart' as service_provider_mojom;


class ShellConnectToApplicationParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 3);
  String applicationUrl = null;
  Object services = null;
  Object exposedServices = null;

  ShellConnectToApplicationParams() : super(kStructSize);

  static ShellConnectToApplicationParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ShellConnectToApplicationParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ShellConnectToApplicationParams result = new ShellConnectToApplicationParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 3)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.applicationUrl = decoder0.decodeString(8, false);
    }
    {
      
      result.services = decoder0.decodeInterfaceRequest(16, true, service_provider_mojom.ServiceProviderStub.newFromEndpoint);
    }
    {
      
      result.exposedServices = decoder0.decodeServiceInterface(20, true, service_provider_mojom.ServiceProviderProxy.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeString(applicationUrl, 8, false);
    
    encoder0.encodeInterfaceRequest(services, 16, true);
    
    encoder0.encodeInterface(exposedServices, 20, true);
  }
}
const int kShell_connectToApplication_name = 0;

const String ShellName =
      'mojo::Shell';

abstract class Shell {
  void connectToApplication(String applicationUrl, Object services, Object exposedServices);

}


class ShellProxyImpl extends bindings.Proxy {
  ShellProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  ShellProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  ShellProxyImpl.unbound() : super.unbound();

  static ShellProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ShellProxyImpl.fromEndpoint(endpoint);

  String get name => ShellName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
}


class _ShellProxyCalls implements Shell {
  ShellProxyImpl _proxyImpl;

  _ShellProxyCalls(this._proxyImpl);
    void connectToApplication(String applicationUrl, Object services, Object exposedServices) {
      var params = new ShellConnectToApplicationParams();
      params.applicationUrl = applicationUrl;
      params.services = services;
      params.exposedServices = exposedServices;
      _proxyImpl.sendMessage(params, kShell_connectToApplication_name);
    }
  
}


class ShellProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  Shell ptr;
  final String name = ShellName;

  ShellProxy(ShellProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _ShellProxyCalls(proxyImpl);

  ShellProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new ShellProxyImpl.fromEndpoint(endpoint) {
    ptr = new _ShellProxyCalls(impl);
  }

  ShellProxy.fromHandle(core.MojoHandle handle) :
      impl = new ShellProxyImpl.fromHandle(handle) {
    ptr = new _ShellProxyCalls(impl);
  }

  ShellProxy.unbound() :
      impl = new ShellProxyImpl.unbound() {
    ptr = new _ShellProxyCalls(impl);
  }

  static ShellProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ShellProxy.fromEndpoint(endpoint);

  void close() => impl.close();
}


class ShellStub extends bindings.Stub {
  Shell _delegate = null;

  ShellStub.fromEndpoint(core.MojoMessagePipeEndpoint endpoint) :
      super(endpoint);

  ShellStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  ShellStub.unbound() : super.unbound();

  static ShellStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ShellStub.fromEndpoint(endpoint);

  static const String name = ShellName;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kShell_connectToApplication_name:
        var params = ShellConnectToApplicationParams.deserialize(
            message.payload);
        _delegate.connectToApplication(params.applicationUrl, params.services, params.exposedServices);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  Shell get delegate => _delegate;
      set delegate(Shell d) {
    assert(_delegate == null);
    _delegate = d;
  }
}


