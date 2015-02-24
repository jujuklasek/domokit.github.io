// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library shell.mojom;

import 'dart:async';
import 'dart:mojo_bindings' as bindings;
import 'dart:mojo_core' as core;
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

abstract class Shell implements core.Listener {
  static const String name = 'mojo::Shell';
  ShellStub stub;

  Shell(core.MojoMessagePipeEndpoint endpoint) :
      stub = new ShellStub(endpoint);

  Shell.fromHandle(core.MojoHandle handle) :
      stub = new ShellStub.fromHandle(handle);

  Shell.fromStub(this.stub);

  Shell.unbound() :
      stub = new ShellStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  Shell get delegate => stub.delegate;
  set delegate(Shell d) {
    stub.delegate = d;
  }
  void connectToApplication(String applicationUrl, Object services, Object exposedServices);

}

class ShellProxy extends bindings.Proxy implements Shell {
  ShellProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  ShellProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  ShellProxy.unbound() : super.unbound();

  String get name => Shell.name;

  static ShellProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ShellProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
  void connectToApplication(String applicationUrl, Object services, Object exposedServices) {
    var params = new ShellConnectToApplicationParams();
    params.applicationUrl = applicationUrl;
    params.services = services;
    params.exposedServices = exposedServices;
    sendMessage(params, kShell_connectToApplication_name);
  }

}

class ShellStub extends bindings.Stub {
  Shell _delegate = null;

  ShellStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  ShellStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  ShellStub.unbound() : super.unbound();

  static ShellStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ShellStub(endpoint);

  static const String name = Shell.name;



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




