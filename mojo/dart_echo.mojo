#!mojo mojo:dart_content_handler
PK     �xjFx��  �  	   main.dart// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'mojo:application';
import 'mojo:bindings';
import 'mojo:core';

import 'package:services/dart/test/echo_service.mojom.dart';

class EchoServiceImpl implements EchoService {
  EchoServiceStub _stub;
  Application _application;

  EchoServiceImpl(this._application, MojoMessagePipeEndpoint endpoint) {
    _stub = new EchoServiceStub.fromEndpoint(endpoint, this);
  }

  echoString(String value, Function responseFactory) {
    if (value == "quit") {
      _stub.close();
    }
    return new Future.value(responseFactory(value));
  }
}

class EchoApplication extends Application {
  EchoApplication.fromHandle(MojoHandle handle) : super.fromHandle(handle);

  @override
  void acceptConnection(String requestorUrl, String resolvedUrl,
      ApplicationConnection connection) {
    connection.provideService(
        EchoServiceName, (endpoint) => new EchoServiceImpl(this, endpoint));
  }
}

main(List args) {
  MojoHandle appHandle = new MojoHandle(args[0]);
  String url = args[1];
  new EchoApplication.fromHandle(appHandle);
}
PK     �KkF��@��  �  *   services/dart/test/echo_service.mojom.dart// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library echo_service.mojom;

import 'dart:async';
import 'mojo:bindings' as bindings;
import 'mojo:core' as core;


class EchoServiceEchoStringParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  String value = null;

  EchoServiceEchoStringParams() : super(kStructSize);

  static EchoServiceEchoStringParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static EchoServiceEchoStringParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    EchoServiceEchoStringParams result = new EchoServiceEchoStringParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.value = decoder0.decodeString(8, true);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeString(value, 8, true);
  }

  String toString() {
    return "EchoServiceEchoStringParams("
           "value: $value" ")";
  }
}

class EchoServiceEchoStringResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  String value = null;

  EchoServiceEchoStringResponseParams() : super(kStructSize);

  static EchoServiceEchoStringResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static EchoServiceEchoStringResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    EchoServiceEchoStringResponseParams result = new EchoServiceEchoStringResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.value = decoder0.decodeString(8, true);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeString(value, 8, true);
  }

  String toString() {
    return "EchoServiceEchoStringResponseParams("
           "value: $value" ")";
  }
}
const int kEchoService_echoString_name = 0;

const String EchoServiceName =
      'mojo::EchoService';

abstract class EchoService {
  Future<EchoServiceEchoStringResponseParams> echoString(String value,[Function responseFactory = null]);

}


class EchoServiceProxyImpl extends bindings.Proxy {
  EchoServiceProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  EchoServiceProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  EchoServiceProxyImpl.unbound() : super.unbound();

  static EchoServiceProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new EchoServiceProxyImpl.fromEndpoint(endpoint);

  String get name => EchoServiceName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kEchoService_echoString_name:
        var r = EchoServiceEchoStringResponseParams.deserialize(
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
    return "EchoServiceProxyImpl($superString)";
  }
}


class _EchoServiceProxyCalls implements EchoService {
  EchoServiceProxyImpl _proxyImpl;

  _EchoServiceProxyCalls(this._proxyImpl);
    Future<EchoServiceEchoStringResponseParams> echoString(String value,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new EchoServiceEchoStringParams();
      params.value = value;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kEchoService_echoString_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
}


class EchoServiceProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  EchoService ptr;
  final String name = EchoServiceName;

  EchoServiceProxy(EchoServiceProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _EchoServiceProxyCalls(proxyImpl);

  EchoServiceProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new EchoServiceProxyImpl.fromEndpoint(endpoint) {
    ptr = new _EchoServiceProxyCalls(impl);
  }

  EchoServiceProxy.fromHandle(core.MojoHandle handle) :
      impl = new EchoServiceProxyImpl.fromHandle(handle) {
    ptr = new _EchoServiceProxyCalls(impl);
  }

  EchoServiceProxy.unbound() :
      impl = new EchoServiceProxyImpl.unbound() {
    ptr = new _EchoServiceProxyCalls(impl);
  }

  static EchoServiceProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new EchoServiceProxy.fromEndpoint(endpoint);

  void close() => impl.close();

  String toString() {
    return "EchoServiceProxy($impl)";
  }
}


class EchoServiceStub extends bindings.Stub {
  EchoService _impl = null;

  EchoServiceStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  EchoServiceStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  EchoServiceStub.unbound() : super.unbound();

  static EchoServiceStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new EchoServiceStub.fromEndpoint(endpoint);

  static const String name = EchoServiceName;


  EchoServiceEchoStringResponseParams _EchoServiceEchoStringResponseParamsFactory(String value) {
    var result = new EchoServiceEchoStringResponseParams();
    result.value = value;
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_impl != null);
    switch (message.header.type) {
      case kEchoService_echoString_name:
        var params = EchoServiceEchoStringParams.deserialize(
            message.payload);
        return _impl.echoString(params.value,_EchoServiceEchoStringResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kEchoService_echoString_name,
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

  EchoService get impl => _impl;
      set impl(EchoService d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "EchoServiceStub($superString)";
  }
}


PK     �KkF��e`�*  �*  9   mojo/public/interfaces/application/application.mojom.dart// Copyright 2014 The Chromium Authors. All rights reserved.
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

  String toString() {
    return "ApplicationInitializeParams("
           "shell: $shell" ", "
           "args: $args" ", "
           "url: $url" ")";
  }
}

class ApplicationAcceptConnectionParams extends bindings.Struct {
  static const int kStructSize = 32;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 4);
  String requestorUrl = null;
  Object services = null;
  Object exposedServices = null;
  String resolvedUrl = null;

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
        (mainDataHeader.version < 4)) {
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
    {
      
      result.resolvedUrl = decoder0.decodeString(24, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeString(requestorUrl, 8, false);
    
    encoder0.encodeInterfaceRequest(services, 16, true);
    
    encoder0.encodeInterface(exposedServices, 20, true);
    
    encoder0.encodeString(resolvedUrl, 24, false);
  }

  String toString() {
    return "ApplicationAcceptConnectionParams("
           "requestorUrl: $requestorUrl" ", "
           "services: $services" ", "
           "exposedServices: $exposedServices" ", "
           "resolvedUrl: $resolvedUrl" ")";
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

  String toString() {
    return "ApplicationRequestQuitParams("")";
  }
}
const int kApplication_initialize_name = 0;
const int kApplication_acceptConnection_name = 1;
const int kApplication_requestQuit_name = 2;

const String ApplicationName =
      'mojo::Application';

abstract class Application {
  void initialize(Object shell, List<String> args, String url);
  void acceptConnection(String requestorUrl, Object services, Object exposedServices, String resolvedUrl);
  void requestQuit();

}


class ApplicationProxyImpl extends bindings.Proxy {
  ApplicationProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  ApplicationProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  ApplicationProxyImpl.unbound() : super.unbound();

  static ApplicationProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ApplicationProxyImpl.fromEndpoint(endpoint);

  String get name => ApplicationName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }

  String toString() {
    var superString = super.toString();
    return "ApplicationProxyImpl($superString)";
  }
}


class _ApplicationProxyCalls implements Application {
  ApplicationProxyImpl _proxyImpl;

  _ApplicationProxyCalls(this._proxyImpl);
    void initialize(Object shell, List<String> args, String url) {
      assert(_proxyImpl.isBound);
      var params = new ApplicationInitializeParams();
      params.shell = shell;
      params.args = args;
      params.url = url;
      _proxyImpl.sendMessage(params, kApplication_initialize_name);
    }
  
    void acceptConnection(String requestorUrl, Object services, Object exposedServices, String resolvedUrl) {
      assert(_proxyImpl.isBound);
      var params = new ApplicationAcceptConnectionParams();
      params.requestorUrl = requestorUrl;
      params.services = services;
      params.exposedServices = exposedServices;
      params.resolvedUrl = resolvedUrl;
      _proxyImpl.sendMessage(params, kApplication_acceptConnection_name);
    }
  
    void requestQuit() {
      assert(_proxyImpl.isBound);
      var params = new ApplicationRequestQuitParams();
      _proxyImpl.sendMessage(params, kApplication_requestQuit_name);
    }
  
}


class ApplicationProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  Application ptr;
  final String name = ApplicationName;

  ApplicationProxy(ApplicationProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _ApplicationProxyCalls(proxyImpl);

  ApplicationProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new ApplicationProxyImpl.fromEndpoint(endpoint) {
    ptr = new _ApplicationProxyCalls(impl);
  }

  ApplicationProxy.fromHandle(core.MojoHandle handle) :
      impl = new ApplicationProxyImpl.fromHandle(handle) {
    ptr = new _ApplicationProxyCalls(impl);
  }

  ApplicationProxy.unbound() :
      impl = new ApplicationProxyImpl.unbound() {
    ptr = new _ApplicationProxyCalls(impl);
  }

  static ApplicationProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ApplicationProxy.fromEndpoint(endpoint);

  void close() => impl.close();

  String toString() {
    return "ApplicationProxy($impl)";
  }
}


class ApplicationStub extends bindings.Stub {
  Application _impl = null;

  ApplicationStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  ApplicationStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  ApplicationStub.unbound() : super.unbound();

  static ApplicationStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ApplicationStub.fromEndpoint(endpoint);

  static const String name = ApplicationName;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_impl != null);
    switch (message.header.type) {
      case kApplication_initialize_name:
        var params = ApplicationInitializeParams.deserialize(
            message.payload);
        _impl.initialize(params.shell, params.args, params.url);
        break;
      case kApplication_acceptConnection_name:
        var params = ApplicationAcceptConnectionParams.deserialize(
            message.payload);
        _impl.acceptConnection(params.requestorUrl, params.services, params.exposedServices, params.resolvedUrl);
        break;
      case kApplication_requestQuit_name:
        var params = ApplicationRequestQuitParams.deserialize(
            message.payload);
        _impl.requestQuit();
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  Application get impl => _impl;
      set impl(Application d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "ApplicationStub($superString)";
  }
}


PK     �KkFE��7�  �  >   mojo/public/interfaces/application/service_provider.mojom.dart// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library service_provider.mojom;

import 'dart:async';
import 'mojo:bindings' as bindings;
import 'mojo:core' as core;


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

  String toString() {
    return "ServiceProviderConnectToServiceParams("
           "interfaceName: $interfaceName" ", "
           "pipe: $pipe" ")";
  }
}
const int kServiceProvider_connectToService_name = 0;

const String ServiceProviderName =
      'mojo::ServiceProvider';

abstract class ServiceProvider {
  void connectToService(String interfaceName, core.MojoMessagePipeEndpoint pipe);

}


class ServiceProviderProxyImpl extends bindings.Proxy {
  ServiceProviderProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  ServiceProviderProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  ServiceProviderProxyImpl.unbound() : super.unbound();

  static ServiceProviderProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ServiceProviderProxyImpl.fromEndpoint(endpoint);

  String get name => ServiceProviderName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }

  String toString() {
    var superString = super.toString();
    return "ServiceProviderProxyImpl($superString)";
  }
}


class _ServiceProviderProxyCalls implements ServiceProvider {
  ServiceProviderProxyImpl _proxyImpl;

  _ServiceProviderProxyCalls(this._proxyImpl);
    void connectToService(String interfaceName, core.MojoMessagePipeEndpoint pipe) {
      assert(_proxyImpl.isBound);
      var params = new ServiceProviderConnectToServiceParams();
      params.interfaceName = interfaceName;
      params.pipe = pipe;
      _proxyImpl.sendMessage(params, kServiceProvider_connectToService_name);
    }
  
}


class ServiceProviderProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  ServiceProvider ptr;
  final String name = ServiceProviderName;

  ServiceProviderProxy(ServiceProviderProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _ServiceProviderProxyCalls(proxyImpl);

  ServiceProviderProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new ServiceProviderProxyImpl.fromEndpoint(endpoint) {
    ptr = new _ServiceProviderProxyCalls(impl);
  }

  ServiceProviderProxy.fromHandle(core.MojoHandle handle) :
      impl = new ServiceProviderProxyImpl.fromHandle(handle) {
    ptr = new _ServiceProviderProxyCalls(impl);
  }

  ServiceProviderProxy.unbound() :
      impl = new ServiceProviderProxyImpl.unbound() {
    ptr = new _ServiceProviderProxyCalls(impl);
  }

  static ServiceProviderProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ServiceProviderProxy.fromEndpoint(endpoint);

  void close() => impl.close();

  String toString() {
    return "ServiceProviderProxy($impl)";
  }
}


class ServiceProviderStub extends bindings.Stub {
  ServiceProvider _impl = null;

  ServiceProviderStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  ServiceProviderStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  ServiceProviderStub.unbound() : super.unbound();

  static ServiceProviderStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ServiceProviderStub.fromEndpoint(endpoint);

  static const String name = ServiceProviderName;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_impl != null);
    switch (message.header.type) {
      case kServiceProvider_connectToService_name:
        var params = ServiceProviderConnectToServiceParams.deserialize(
            message.payload);
        _impl.connectToService(params.interfaceName, params.pipe);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  ServiceProvider get impl => _impl;
      set impl(ServiceProvider d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "ServiceProviderStub($superString)";
  }
}


PK     �KkF���  �  3   mojo/public/interfaces/application/shell.mojom.dart// Copyright 2014 The Chromium Authors. All rights reserved.
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

  String toString() {
    return "ShellConnectToApplicationParams("
           "applicationUrl: $applicationUrl" ", "
           "services: $services" ", "
           "exposedServices: $exposedServices" ")";
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
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

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

  String toString() {
    var superString = super.toString();
    return "ShellProxyImpl($superString)";
  }
}


class _ShellProxyCalls implements Shell {
  ShellProxyImpl _proxyImpl;

  _ShellProxyCalls(this._proxyImpl);
    void connectToApplication(String applicationUrl, Object services, Object exposedServices) {
      assert(_proxyImpl.isBound);
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

  String toString() {
    return "ShellProxy($impl)";
  }
}


class ShellStub extends bindings.Stub {
  Shell _impl = null;

  ShellStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  ShellStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  ShellStub.unbound() : super.unbound();

  static ShellStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ShellStub.fromEndpoint(endpoint);

  static const String name = ShellName;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_impl != null);
    switch (message.header.type) {
      case kShell_connectToApplication_name:
        var params = ShellConnectToApplicationParams.deserialize(
            message.payload);
        _impl.connectToApplication(params.applicationUrl, params.services, params.exposedServices);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  Shell get impl => _impl;
      set impl(Shell d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "ShellStub($superString)";
  }
}


PK     �xjFx��  �  	           ��    main.dartPK     �KkF��@��  �  *           ��  services/dart/test/echo_service.mojom.dartPK     �KkF��e`�*  �*  9           ��"  mojo/public/interfaces/application/application.mojom.dartPK     �KkFE��7�  �  >           ��M  mojo/public/interfaces/application/service_provider.mojom.dartPK     �KkF���  �  3           �	e  mojo/public/interfaces/application/shell.mojom.dartPK      �  A|    