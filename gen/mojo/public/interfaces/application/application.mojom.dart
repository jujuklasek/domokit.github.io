// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library application.mojom;

import 'dart:async';
import 'mojo:bindings' as bindings;
import 'mojo:core' as core;
import 'package:mojo/public/interfaces/application/service_provider.mojom.dart' as service_provider_mojom;
import 'package:mojo/public/interfaces/application/shell.mojom.dart' as shell_mojom;


class ApplicationInitializeParams extends bindings.Struct {
  static const int kStructSize = 32;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 3);
  Object shell = null;
  List<String> args = null;
  String url = null;

  ApplicationInitializeParams() : super(kStructSize);

  static ApplicationInitializeParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ApplicationInitializeParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ApplicationInitializeParams result = new ApplicationInitializeParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 3)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.shell = decoder0.decodeServiceInterface(8, false, shell_mojom.ShellProxy.newFromEndpoint);
    }
    {
      
      var decoder1 = decoder0.decodePointer(16, true);
      if (decoder1 == null) {
        result.args = null;
      } else {
        var si1 = decoder1.decodeDataHeaderForPointerArray(bindings.kUnspecifiedArrayLength);
        result.args = new List<String>(si1.numElements);
        for (int i1 = 0; i1 < si1.numElements; ++i1) {
          
          result.args[i1] = decoder1.decodeString(bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i1, false);
        }
      }
    }
    {
      
      result.url = decoder0.decodeString(24, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInterface(shell, 8, false);
    
    if (args == null) {
      encoder0.encodeNullPointer(16, true);
    } else {
      var encoder1 = encoder0.encodePointerArray(args.length, 16, bindings.kUnspecifiedArrayLength);
      for (int i0 = 0; i0 < args.length; ++i0) {
        
        encoder1.encodeString(args[i0], bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i0, false);
      }
    }
    
    encoder0.encodeString(url, 24, false);
  }
}

class ApplicationAcceptConnectionParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 3);
  String requestorUrl = null;
  Object services = null;
  Object exposedServices = null;

  ApplicationAcceptConnectionParams() : super(kStructSize);

  static ApplicationAcceptConnectionParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ApplicationAcceptConnectionParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ApplicationAcceptConnectionParams result = new ApplicationAcceptConnectionParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 3)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.requestorUrl = decoder0.decodeString(8, false);
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
    
    encoder0.encodeString(requestorUrl, 8, false);
    
    encoder0.encodeInterfaceRequest(services, 16, true);
    
    encoder0.encodeInterface(exposedServices, 20, true);
  }
}

class ApplicationRequestQuitParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  ApplicationRequestQuitParams() : super(kStructSize);

  static ApplicationRequestQuitParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ApplicationRequestQuitParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ApplicationRequestQuitParams result = new ApplicationRequestQuitParams();

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
const int kApplication_initialize_name = 0;
const int kApplication_acceptConnection_name = 1;
const int kApplication_requestQuit_name = 2;

abstract class Application implements core.Listener {
  static const String name = 'mojo::Application';
  ApplicationStub stub;

  Application(core.MojoMessagePipeEndpoint endpoint) :
      stub = new ApplicationStub(endpoint);

  Application.fromHandle(core.MojoHandle handle) :
      stub = new ApplicationStub.fromHandle(handle);

  Application.fromStub(this.stub);

  Application.unbound() :
      stub = new ApplicationStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  Application get delegate => stub.delegate;
  set delegate(Application d) {
    stub.delegate = d;
  }
  void initialize(Object shell, List<String> args, String url);
  void acceptConnection(String requestorUrl, Object services, Object exposedServices);
  void requestQuit();

}

class ApplicationProxy extends bindings.Proxy implements Application {
  ApplicationProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  ApplicationProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  ApplicationProxy.unbound() : super.unbound();

  String get name => Application.name;

  static ApplicationProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ApplicationProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
  void initialize(Object shell, List<String> args, String url) {
    var params = new ApplicationInitializeParams();
    params.shell = shell;
    params.args = args;
    params.url = url;
    sendMessage(params, kApplication_initialize_name);
  }

  void acceptConnection(String requestorUrl, Object services, Object exposedServices) {
    var params = new ApplicationAcceptConnectionParams();
    params.requestorUrl = requestorUrl;
    params.services = services;
    params.exposedServices = exposedServices;
    sendMessage(params, kApplication_acceptConnection_name);
  }

  void requestQuit() {
    var params = new ApplicationRequestQuitParams();
    sendMessage(params, kApplication_requestQuit_name);
  }

}

class ApplicationStub extends bindings.Stub {
  Application _delegate = null;

  ApplicationStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  ApplicationStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  ApplicationStub.unbound() : super.unbound();

  static ApplicationStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ApplicationStub(endpoint);

  static const String name = Application.name;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kApplication_initialize_name:
        var params = ApplicationInitializeParams.deserialize(
            message.payload);
        _delegate.initialize(params.shell, params.args, params.url);
        break;
      case kApplication_acceptConnection_name:
        var params = ApplicationAcceptConnectionParams.deserialize(
            message.payload);
        _delegate.acceptConnection(params.requestorUrl, params.services, params.exposedServices);
        break;
      case kApplication_requestQuit_name:
        var params = ApplicationRequestQuitParams.deserialize(
            message.payload);
        _delegate.requestQuit();
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  Application get delegate => _delegate;
      set delegate(Application d) {
    assert(_delegate == null);
    _delegate = d;
  }
}




