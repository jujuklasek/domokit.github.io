#!mojo mojo:dart_content_handler
PK     TlF����P  P  	   main.dart// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Run with, e.g.:
// mojo_shell "mojo:dart_wget http://www.google.com"

import 'dart:async';
import 'dart:typed_data';
import 'dart:mojo.application';
import 'dart:mojo.bindings';
import 'dart:mojo.core';

import 'package:mojo/services/network/public/interfaces/network_service.mojom.dart';
import 'package:mojo/services/network/public/interfaces/url_loader.mojom.dart';

class WGet extends Application {
  NetworkServiceProxy _networkService;
  UrlLoaderProxy _urlLoader;

  WGet.fromHandle(MojoHandle handle) : super.fromHandle(handle);

  void initialize(List<String> args, String url) {
    run(args);
  }

  run(List<String> args) async {
    if (args == null || args.length != 2) {
      throw "Expected URL argument";
    }

    ByteData bodyData = await _getUrl(args[1]);
    print(">>> Body <<<");
    print(new String.fromCharCodes(bodyData.buffer.asUint8List()));
    print(">>> EOF <<<");

    _closeProxies();
    await close();
    assert(MojoHandle.reportLeakedHandles());
  }

  Future<ByteData> _getUrl(String url) async {
    _initProxiesIfNeeded();

    var urlRequest = new UrlRequest()
      ..url = url
      ..autoFollowRedirects = true;

    var urlResponse = await _urlLoader.ptr.start(urlRequest);
    print(">>> Headers <<<");
    print(urlResponse.response.headers.join('\n'));

    return DataPipeDrainer.drainHandle(urlResponse.response.body);
  }

  void _initProxiesIfNeeded() {
    if (_networkService == null) {
      _networkService = new NetworkServiceProxy.unbound();
      connectToService("mojo:network_service", _networkService);
    }
    if (_urlLoader == null) {
      _urlLoader = new UrlLoaderProxy.unbound();
      _networkService.ptr.createUrlLoader(_urlLoader);
    }
  }

  void _closeProxies() {
    _urlLoader.close();
    _urlLoader = null;
    _networkService.close();
    _networkService = null;
  }
}

main(List args) {
  MojoHandle appHandle = new MojoHandle(args[0]);
  new WGet.fromHandle(appHandle);
}
PK     @[tF'@x+  +  9   mojo/public/interfaces/application/application.mojom.dart// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library application.mojom;

import 'dart:async';
import 'dart:mojo.bindings' as bindings;
import 'dart:mojo.core' as core;
import 'package:mojo/public/interfaces/application/service_provider.mojom.dart' as service_provider_mojom;
import 'package:mojo/public/interfaces/application/shell.mojom.dart' as shell_mojom;


class ApplicationInitializeParams extends bindings.Struct {
  static const int kStructSize = 32;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
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
        (mainDataHeader.version < 0)) {
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
      const bindings.StructDataHeader(kStructSize, 0);
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
        (mainDataHeader.version < 0)) {
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

  Future close({bool nodefer: false}) => impl.close(nodefer: nodefer);

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


PK     @[tFj��  �  >   mojo/public/interfaces/application/service_provider.mojom.dart// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library service_provider.mojom;

import 'dart:async';
import 'dart:mojo.bindings' as bindings;
import 'dart:mojo.core' as core;


class ServiceProviderConnectToServiceParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
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
        (mainDataHeader.version < 0)) {
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

  Future close({bool nodefer: false}) => impl.close(nodefer: nodefer);

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


PK     @[tFI��    3   mojo/public/interfaces/application/shell.mojom.dart// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library shell.mojom;

import 'dart:async';
import 'dart:mojo.bindings' as bindings;
import 'dart:mojo.core' as core;
import 'package:mojo/public/interfaces/application/service_provider.mojom.dart' as service_provider_mojom;


class ShellConnectToApplicationParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
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
        (mainDataHeader.version < 0)) {
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

  Future close({bool nodefer: false}) => impl.close(nodefer: nodefer);

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


PK     @[tFcWHaj.  j.  ?   mojo/services/network/public/interfaces/cookie_store.mojom.dart// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library cookie_store.mojom;

import 'dart:async';
import 'dart:mojo.bindings' as bindings;
import 'dart:mojo.core' as core;


class CookieStoreGetParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  String url = null;

  CookieStoreGetParams() : super(kStructSize);

  static CookieStoreGetParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static CookieStoreGetParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    CookieStoreGetParams result = new CookieStoreGetParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
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

  String toString() {
    return "CookieStoreGetParams("
           "url: $url" ")";
  }
}

class CookieStoreGetResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  String cookies = null;

  CookieStoreGetResponseParams() : super(kStructSize);

  static CookieStoreGetResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static CookieStoreGetResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    CookieStoreGetResponseParams result = new CookieStoreGetResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.cookies = decoder0.decodeString(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeString(cookies, 8, false);
  }

  String toString() {
    return "CookieStoreGetResponseParams("
           "cookies: $cookies" ")";
  }
}

class CookieStoreSetParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  String url = null;
  String cookie = null;

  CookieStoreSetParams() : super(kStructSize);

  static CookieStoreSetParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static CookieStoreSetParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    CookieStoreSetParams result = new CookieStoreSetParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.url = decoder0.decodeString(8, false);
    }
    {
      
      result.cookie = decoder0.decodeString(16, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeString(url, 8, false);
    
    encoder0.encodeString(cookie, 16, false);
  }

  String toString() {
    return "CookieStoreSetParams("
           "url: $url" ", "
           "cookie: $cookie" ")";
  }
}

class CookieStoreSetResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  bool success = false;

  CookieStoreSetResponseParams() : super(kStructSize);

  static CookieStoreSetResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static CookieStoreSetResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    CookieStoreSetResponseParams result = new CookieStoreSetResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.success = decoder0.decodeBool(8, 0);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeBool(success, 8, 0);
  }

  String toString() {
    return "CookieStoreSetResponseParams("
           "success: $success" ")";
  }
}
const int kCookieStore_get_name = 0;
const int kCookieStore_set_name = 1;

const String CookieStoreName =
      'mojo::CookieStore';

abstract class CookieStore {
  Future<CookieStoreGetResponseParams> get(String url,[Function responseFactory = null]);
  Future<CookieStoreSetResponseParams> set(String url,String cookie,[Function responseFactory = null]);

}


class CookieStoreProxyImpl extends bindings.Proxy {
  CookieStoreProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  CookieStoreProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  CookieStoreProxyImpl.unbound() : super.unbound();

  static CookieStoreProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new CookieStoreProxyImpl.fromEndpoint(endpoint);

  String get name => CookieStoreName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kCookieStore_get_name:
        var r = CookieStoreGetResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          throw 'Message had unknown request Id: ${message.header.requestId}';
        }
        completerMap.remove(message.header.requestId);
        assert(!c.isCompleted);
        c.complete(r);
        break;
      case kCookieStore_set_name:
        var r = CookieStoreSetResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          throw 'Message had unknown request Id: ${message.header.requestId}';
        }
        completerMap.remove(message.header.requestId);
        assert(!c.isCompleted);
        c.complete(r);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }

  String toString() {
    var superString = super.toString();
    return "CookieStoreProxyImpl($superString)";
  }
}


class _CookieStoreProxyCalls implements CookieStore {
  CookieStoreProxyImpl _proxyImpl;

  _CookieStoreProxyCalls(this._proxyImpl);
    Future<CookieStoreGetResponseParams> get(String url,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new CookieStoreGetParams();
      params.url = url;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kCookieStore_get_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    Future<CookieStoreSetResponseParams> set(String url,String cookie,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new CookieStoreSetParams();
      params.url = url;
      params.cookie = cookie;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kCookieStore_set_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
}


class CookieStoreProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  CookieStore ptr;
  final String name = CookieStoreName;

  CookieStoreProxy(CookieStoreProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _CookieStoreProxyCalls(proxyImpl);

  CookieStoreProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new CookieStoreProxyImpl.fromEndpoint(endpoint) {
    ptr = new _CookieStoreProxyCalls(impl);
  }

  CookieStoreProxy.fromHandle(core.MojoHandle handle) :
      impl = new CookieStoreProxyImpl.fromHandle(handle) {
    ptr = new _CookieStoreProxyCalls(impl);
  }

  CookieStoreProxy.unbound() :
      impl = new CookieStoreProxyImpl.unbound() {
    ptr = new _CookieStoreProxyCalls(impl);
  }

  static CookieStoreProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new CookieStoreProxy.fromEndpoint(endpoint);

  Future close({bool nodefer: false}) => impl.close(nodefer: nodefer);

  String toString() {
    return "CookieStoreProxy($impl)";
  }
}


class CookieStoreStub extends bindings.Stub {
  CookieStore _impl = null;

  CookieStoreStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  CookieStoreStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  CookieStoreStub.unbound() : super.unbound();

  static CookieStoreStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new CookieStoreStub.fromEndpoint(endpoint);

  static const String name = CookieStoreName;


  CookieStoreGetResponseParams _CookieStoreGetResponseParamsFactory(String cookies) {
    var result = new CookieStoreGetResponseParams();
    result.cookies = cookies;
    return result;
  }
  CookieStoreSetResponseParams _CookieStoreSetResponseParamsFactory(bool success) {
    var result = new CookieStoreSetResponseParams();
    result.success = success;
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_impl != null);
    switch (message.header.type) {
      case kCookieStore_get_name:
        var params = CookieStoreGetParams.deserialize(
            message.payload);
        return _impl.get(params.url,_CookieStoreGetResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kCookieStore_get_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kCookieStore_set_name:
        var params = CookieStoreSetParams.deserialize(
            message.payload);
        return _impl.set(params.url,params.cookie,_CookieStoreSetResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kCookieStore_set_name,
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

  CookieStore get impl => _impl;
      set impl(CookieStore d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "CookieStoreStub($superString)";
  }
}


PK     @[tF�4QYS  S  >   mojo/services/network/public/interfaces/net_address.mojom.dart// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library net_address.mojom;

import 'dart:async';
import 'dart:mojo.bindings' as bindings;
import 'dart:mojo.core' as core;

final int NetAddressFamily_UNSPECIFIED = 0;
final int NetAddressFamily_IPV4 = NetAddressFamily_UNSPECIFIED + 1;
final int NetAddressFamily_IPV6 = NetAddressFamily_IPV4 + 1;


class NetAddressIPv4 extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  int port = 0;
  List<int> addr = null;

  NetAddressIPv4() : super(kStructSize);

  static NetAddressIPv4 deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static NetAddressIPv4 decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    NetAddressIPv4 result = new NetAddressIPv4();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.port = decoder0.decodeUint16(8);
    }
    {
      
      result.addr = decoder0.decodeUint8Array(16, bindings.kNothingNullable, 4);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint16(port, 8);
    
    encoder0.encodeUint8Array(addr, 16, bindings.kNothingNullable, 4);
  }

  String toString() {
    return "NetAddressIPv4("
           "port: $port" ", "
           "addr: $addr" ")";
  }
}

class NetAddressIPv6 extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  int port = 0;
  List<int> addr = null;

  NetAddressIPv6() : super(kStructSize);

  static NetAddressIPv6 deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static NetAddressIPv6 decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    NetAddressIPv6 result = new NetAddressIPv6();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.port = decoder0.decodeUint16(8);
    }
    {
      
      result.addr = decoder0.decodeUint8Array(16, bindings.kNothingNullable, 16);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint16(port, 8);
    
    encoder0.encodeUint8Array(addr, 16, bindings.kNothingNullable, 16);
  }

  String toString() {
    return "NetAddressIPv6("
           "port: $port" ", "
           "addr: $addr" ")";
  }
}

class NetAddress extends bindings.Struct {
  static const int kStructSize = 32;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  int family = NetAddressFamily_UNSPECIFIED;
  NetAddressIPv4 ipv4 = null;
  NetAddressIPv6 ipv6 = null;

  NetAddress() : super(kStructSize);

  static NetAddress deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static NetAddress decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    NetAddress result = new NetAddress();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.family = decoder0.decodeInt32(8);
    }
    {
      
      var decoder1 = decoder0.decodePointer(16, true);
      result.ipv4 = NetAddressIPv4.decode(decoder1);
    }
    {
      
      var decoder1 = decoder0.decodePointer(24, true);
      result.ipv6 = NetAddressIPv6.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInt32(family, 8);
    
    encoder0.encodeStruct(ipv4, 16, true);
    
    encoder0.encodeStruct(ipv6, 24, true);
  }

  String toString() {
    return "NetAddress("
           "family: $family" ", "
           "ipv4: $ipv4" ", "
           "ipv6: $ipv6" ")";
  }
}

PK     @[tFR��;+  +  @   mojo/services/network/public/interfaces/network_error.mojom.dart// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library network_error.mojom;

import 'dart:async';
import 'dart:mojo.bindings' as bindings;
import 'dart:mojo.core' as core;


class NetworkError extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  int code = 0;
  String description = null;

  NetworkError() : super(kStructSize);

  static NetworkError deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static NetworkError decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    NetworkError result = new NetworkError();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.code = decoder0.decodeInt32(8);
    }
    {
      
      result.description = decoder0.decodeString(16, true);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInt32(code, 8);
    
    encoder0.encodeString(description, 16, true);
  }

  String toString() {
    return "NetworkError("
           "code: $code" ", "
           "description: $description" ")";
  }
}

PK     @[tFGհ��_  �_  B   mojo/services/network/public/interfaces/network_service.mojom.dart// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library network_service.mojom;

import 'dart:async';
import 'dart:mojo.bindings' as bindings;
import 'dart:mojo.core' as core;
import 'package:mojo/services/network/public/interfaces/cookie_store.mojom.dart' as cookie_store_mojom;
import 'package:mojo/services/network/public/interfaces/net_address.mojom.dart' as net_address_mojom;
import 'package:mojo/services/network/public/interfaces/network_error.mojom.dart' as network_error_mojom;
import 'package:mojo/services/network/public/interfaces/tcp_bound_socket.mojom.dart' as tcp_bound_socket_mojom;
import 'package:mojo/services/network/public/interfaces/tcp_connected_socket.mojom.dart' as tcp_connected_socket_mojom;
import 'package:mojo/services/network/public/interfaces/udp_socket.mojom.dart' as udp_socket_mojom;
import 'package:mojo/services/network/public/interfaces/url_loader.mojom.dart' as url_loader_mojom;
import 'package:mojo/services/network/public/interfaces/web_socket.mojom.dart' as web_socket_mojom;


class NetworkServiceCreateUrlLoaderParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  Object loader = null;

  NetworkServiceCreateUrlLoaderParams() : super(kStructSize);

  static NetworkServiceCreateUrlLoaderParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static NetworkServiceCreateUrlLoaderParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    NetworkServiceCreateUrlLoaderParams result = new NetworkServiceCreateUrlLoaderParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.loader = decoder0.decodeInterfaceRequest(8, false, url_loader_mojom.UrlLoaderStub.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInterfaceRequest(loader, 8, false);
  }

  String toString() {
    return "NetworkServiceCreateUrlLoaderParams("
           "loader: $loader" ")";
  }
}

class NetworkServiceGetCookieStoreParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  Object cookieStore = null;

  NetworkServiceGetCookieStoreParams() : super(kStructSize);

  static NetworkServiceGetCookieStoreParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static NetworkServiceGetCookieStoreParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    NetworkServiceGetCookieStoreParams result = new NetworkServiceGetCookieStoreParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.cookieStore = decoder0.decodeInterfaceRequest(8, false, cookie_store_mojom.CookieStoreStub.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInterfaceRequest(cookieStore, 8, false);
  }

  String toString() {
    return "NetworkServiceGetCookieStoreParams("
           "cookieStore: $cookieStore" ")";
  }
}

class NetworkServiceCreateWebSocketParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  Object socket = null;

  NetworkServiceCreateWebSocketParams() : super(kStructSize);

  static NetworkServiceCreateWebSocketParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static NetworkServiceCreateWebSocketParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    NetworkServiceCreateWebSocketParams result = new NetworkServiceCreateWebSocketParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.socket = decoder0.decodeInterfaceRequest(8, false, web_socket_mojom.WebSocketStub.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInterfaceRequest(socket, 8, false);
  }

  String toString() {
    return "NetworkServiceCreateWebSocketParams("
           "socket: $socket" ")";
  }
}

class NetworkServiceCreateTcpBoundSocketParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  net_address_mojom.NetAddress localAddress = null;
  Object boundSocket = null;

  NetworkServiceCreateTcpBoundSocketParams() : super(kStructSize);

  static NetworkServiceCreateTcpBoundSocketParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static NetworkServiceCreateTcpBoundSocketParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    NetworkServiceCreateTcpBoundSocketParams result = new NetworkServiceCreateTcpBoundSocketParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, true);
      result.localAddress = net_address_mojom.NetAddress.decode(decoder1);
    }
    {
      
      result.boundSocket = decoder0.decodeInterfaceRequest(16, false, tcp_bound_socket_mojom.TcpBoundSocketStub.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(localAddress, 8, true);
    
    encoder0.encodeInterfaceRequest(boundSocket, 16, false);
  }

  String toString() {
    return "NetworkServiceCreateTcpBoundSocketParams("
           "localAddress: $localAddress" ", "
           "boundSocket: $boundSocket" ")";
  }
}

class NetworkServiceCreateTcpBoundSocketResponseParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  network_error_mojom.NetworkError result = null;
  net_address_mojom.NetAddress boundTo = null;

  NetworkServiceCreateTcpBoundSocketResponseParams() : super(kStructSize);

  static NetworkServiceCreateTcpBoundSocketResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static NetworkServiceCreateTcpBoundSocketResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    NetworkServiceCreateTcpBoundSocketResponseParams result = new NetworkServiceCreateTcpBoundSocketResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.result = network_error_mojom.NetworkError.decode(decoder1);
    }
    {
      
      var decoder1 = decoder0.decodePointer(16, true);
      result.boundTo = net_address_mojom.NetAddress.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(result, 8, false);
    
    encoder0.encodeStruct(boundTo, 16, true);
  }

  String toString() {
    return "NetworkServiceCreateTcpBoundSocketResponseParams("
           "result: $result" ", "
           "boundTo: $boundTo" ")";
  }
}

class NetworkServiceCreateTcpConnectedSocketParams extends bindings.Struct {
  static const int kStructSize = 32;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  net_address_mojom.NetAddress remoteAddress = null;
  core.MojoDataPipeConsumer sendStream = null;
  core.MojoDataPipeProducer receiveStream = null;
  Object clientSocket = null;

  NetworkServiceCreateTcpConnectedSocketParams() : super(kStructSize);

  static NetworkServiceCreateTcpConnectedSocketParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static NetworkServiceCreateTcpConnectedSocketParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    NetworkServiceCreateTcpConnectedSocketParams result = new NetworkServiceCreateTcpConnectedSocketParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.remoteAddress = net_address_mojom.NetAddress.decode(decoder1);
    }
    {
      
      result.sendStream = decoder0.decodeConsumerHandle(16, false);
    }
    {
      
      result.receiveStream = decoder0.decodeProducerHandle(20, false);
    }
    {
      
      result.clientSocket = decoder0.decodeInterfaceRequest(24, false, tcp_connected_socket_mojom.TcpConnectedSocketStub.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(remoteAddress, 8, false);
    
    encoder0.encodeConsumerHandle(sendStream, 16, false);
    
    encoder0.encodeProducerHandle(receiveStream, 20, false);
    
    encoder0.encodeInterfaceRequest(clientSocket, 24, false);
  }

  String toString() {
    return "NetworkServiceCreateTcpConnectedSocketParams("
           "remoteAddress: $remoteAddress" ", "
           "sendStream: $sendStream" ", "
           "receiveStream: $receiveStream" ", "
           "clientSocket: $clientSocket" ")";
  }
}

class NetworkServiceCreateTcpConnectedSocketResponseParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  network_error_mojom.NetworkError result = null;
  net_address_mojom.NetAddress localAddress = null;

  NetworkServiceCreateTcpConnectedSocketResponseParams() : super(kStructSize);

  static NetworkServiceCreateTcpConnectedSocketResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static NetworkServiceCreateTcpConnectedSocketResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    NetworkServiceCreateTcpConnectedSocketResponseParams result = new NetworkServiceCreateTcpConnectedSocketResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.result = network_error_mojom.NetworkError.decode(decoder1);
    }
    {
      
      var decoder1 = decoder0.decodePointer(16, true);
      result.localAddress = net_address_mojom.NetAddress.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(result, 8, false);
    
    encoder0.encodeStruct(localAddress, 16, true);
  }

  String toString() {
    return "NetworkServiceCreateTcpConnectedSocketResponseParams("
           "result: $result" ", "
           "localAddress: $localAddress" ")";
  }
}

class NetworkServiceCreateUdpSocketParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  Object socket = null;

  NetworkServiceCreateUdpSocketParams() : super(kStructSize);

  static NetworkServiceCreateUdpSocketParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static NetworkServiceCreateUdpSocketParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    NetworkServiceCreateUdpSocketParams result = new NetworkServiceCreateUdpSocketParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.socket = decoder0.decodeInterfaceRequest(8, false, udp_socket_mojom.UdpSocketStub.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInterfaceRequest(socket, 8, false);
  }

  String toString() {
    return "NetworkServiceCreateUdpSocketParams("
           "socket: $socket" ")";
  }
}
const int kNetworkService_createUrlLoader_name = 0;
const int kNetworkService_getCookieStore_name = 1;
const int kNetworkService_createWebSocket_name = 2;
const int kNetworkService_createTcpBoundSocket_name = 3;
const int kNetworkService_createTcpConnectedSocket_name = 4;
const int kNetworkService_createUdpSocket_name = 5;

const String NetworkServiceName =
      'mojo::NetworkService';

abstract class NetworkService {
  void createUrlLoader(Object loader);
  void getCookieStore(Object cookieStore);
  void createWebSocket(Object socket);
  Future<NetworkServiceCreateTcpBoundSocketResponseParams> createTcpBoundSocket(net_address_mojom.NetAddress localAddress,Object boundSocket,[Function responseFactory = null]);
  Future<NetworkServiceCreateTcpConnectedSocketResponseParams> createTcpConnectedSocket(net_address_mojom.NetAddress remoteAddress,core.MojoDataPipeConsumer sendStream,core.MojoDataPipeProducer receiveStream,Object clientSocket,[Function responseFactory = null]);
  void createUdpSocket(Object socket);

}


class NetworkServiceProxyImpl extends bindings.Proxy {
  NetworkServiceProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  NetworkServiceProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  NetworkServiceProxyImpl.unbound() : super.unbound();

  static NetworkServiceProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new NetworkServiceProxyImpl.fromEndpoint(endpoint);

  String get name => NetworkServiceName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kNetworkService_createTcpBoundSocket_name:
        var r = NetworkServiceCreateTcpBoundSocketResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          throw 'Message had unknown request Id: ${message.header.requestId}';
        }
        completerMap.remove(message.header.requestId);
        assert(!c.isCompleted);
        c.complete(r);
        break;
      case kNetworkService_createTcpConnectedSocket_name:
        var r = NetworkServiceCreateTcpConnectedSocketResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          throw 'Message had unknown request Id: ${message.header.requestId}';
        }
        completerMap.remove(message.header.requestId);
        assert(!c.isCompleted);
        c.complete(r);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }

  String toString() {
    var superString = super.toString();
    return "NetworkServiceProxyImpl($superString)";
  }
}


class _NetworkServiceProxyCalls implements NetworkService {
  NetworkServiceProxyImpl _proxyImpl;

  _NetworkServiceProxyCalls(this._proxyImpl);
    void createUrlLoader(Object loader) {
      assert(_proxyImpl.isBound);
      var params = new NetworkServiceCreateUrlLoaderParams();
      params.loader = loader;
      _proxyImpl.sendMessage(params, kNetworkService_createUrlLoader_name);
    }
  
    void getCookieStore(Object cookieStore) {
      assert(_proxyImpl.isBound);
      var params = new NetworkServiceGetCookieStoreParams();
      params.cookieStore = cookieStore;
      _proxyImpl.sendMessage(params, kNetworkService_getCookieStore_name);
    }
  
    void createWebSocket(Object socket) {
      assert(_proxyImpl.isBound);
      var params = new NetworkServiceCreateWebSocketParams();
      params.socket = socket;
      _proxyImpl.sendMessage(params, kNetworkService_createWebSocket_name);
    }
  
    Future<NetworkServiceCreateTcpBoundSocketResponseParams> createTcpBoundSocket(net_address_mojom.NetAddress localAddress,Object boundSocket,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new NetworkServiceCreateTcpBoundSocketParams();
      params.localAddress = localAddress;
      params.boundSocket = boundSocket;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kNetworkService_createTcpBoundSocket_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    Future<NetworkServiceCreateTcpConnectedSocketResponseParams> createTcpConnectedSocket(net_address_mojom.NetAddress remoteAddress,core.MojoDataPipeConsumer sendStream,core.MojoDataPipeProducer receiveStream,Object clientSocket,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new NetworkServiceCreateTcpConnectedSocketParams();
      params.remoteAddress = remoteAddress;
      params.sendStream = sendStream;
      params.receiveStream = receiveStream;
      params.clientSocket = clientSocket;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kNetworkService_createTcpConnectedSocket_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    void createUdpSocket(Object socket) {
      assert(_proxyImpl.isBound);
      var params = new NetworkServiceCreateUdpSocketParams();
      params.socket = socket;
      _proxyImpl.sendMessage(params, kNetworkService_createUdpSocket_name);
    }
  
}


class NetworkServiceProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  NetworkService ptr;
  final String name = NetworkServiceName;

  NetworkServiceProxy(NetworkServiceProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _NetworkServiceProxyCalls(proxyImpl);

  NetworkServiceProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new NetworkServiceProxyImpl.fromEndpoint(endpoint) {
    ptr = new _NetworkServiceProxyCalls(impl);
  }

  NetworkServiceProxy.fromHandle(core.MojoHandle handle) :
      impl = new NetworkServiceProxyImpl.fromHandle(handle) {
    ptr = new _NetworkServiceProxyCalls(impl);
  }

  NetworkServiceProxy.unbound() :
      impl = new NetworkServiceProxyImpl.unbound() {
    ptr = new _NetworkServiceProxyCalls(impl);
  }

  static NetworkServiceProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new NetworkServiceProxy.fromEndpoint(endpoint);

  Future close({bool nodefer: false}) => impl.close(nodefer: nodefer);

  String toString() {
    return "NetworkServiceProxy($impl)";
  }
}


class NetworkServiceStub extends bindings.Stub {
  NetworkService _impl = null;

  NetworkServiceStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  NetworkServiceStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  NetworkServiceStub.unbound() : super.unbound();

  static NetworkServiceStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new NetworkServiceStub.fromEndpoint(endpoint);

  static const String name = NetworkServiceName;


  NetworkServiceCreateTcpBoundSocketResponseParams _NetworkServiceCreateTcpBoundSocketResponseParamsFactory(network_error_mojom.NetworkError result, net_address_mojom.NetAddress boundTo) {
    var result = new NetworkServiceCreateTcpBoundSocketResponseParams();
    result.result = result;
    result.boundTo = boundTo;
    return result;
  }
  NetworkServiceCreateTcpConnectedSocketResponseParams _NetworkServiceCreateTcpConnectedSocketResponseParamsFactory(network_error_mojom.NetworkError result, net_address_mojom.NetAddress localAddress) {
    var result = new NetworkServiceCreateTcpConnectedSocketResponseParams();
    result.result = result;
    result.localAddress = localAddress;
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_impl != null);
    switch (message.header.type) {
      case kNetworkService_createUrlLoader_name:
        var params = NetworkServiceCreateUrlLoaderParams.deserialize(
            message.payload);
        _impl.createUrlLoader(params.loader);
        break;
      case kNetworkService_getCookieStore_name:
        var params = NetworkServiceGetCookieStoreParams.deserialize(
            message.payload);
        _impl.getCookieStore(params.cookieStore);
        break;
      case kNetworkService_createWebSocket_name:
        var params = NetworkServiceCreateWebSocketParams.deserialize(
            message.payload);
        _impl.createWebSocket(params.socket);
        break;
      case kNetworkService_createTcpBoundSocket_name:
        var params = NetworkServiceCreateTcpBoundSocketParams.deserialize(
            message.payload);
        return _impl.createTcpBoundSocket(params.localAddress,params.boundSocket,_NetworkServiceCreateTcpBoundSocketResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kNetworkService_createTcpBoundSocket_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kNetworkService_createTcpConnectedSocket_name:
        var params = NetworkServiceCreateTcpConnectedSocketParams.deserialize(
            message.payload);
        return _impl.createTcpConnectedSocket(params.remoteAddress,params.sendStream,params.receiveStream,params.clientSocket,_NetworkServiceCreateTcpConnectedSocketResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kNetworkService_createTcpConnectedSocket_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kNetworkService_createUdpSocket_name:
        var params = NetworkServiceCreateUdpSocketParams.deserialize(
            message.payload);
        _impl.createUdpSocket(params.socket);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  NetworkService get impl => _impl;
      set impl(NetworkService d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "NetworkServiceStub($superString)";
  }
}


PK     @[tF�|	�9  9  C   mojo/services/network/public/interfaces/tcp_bound_socket.mojom.dart// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library tcp_bound_socket.mojom;

import 'dart:async';
import 'dart:mojo.bindings' as bindings;
import 'dart:mojo.core' as core;
import 'package:mojo/services/network/public/interfaces/net_address.mojom.dart' as net_address_mojom;
import 'package:mojo/services/network/public/interfaces/network_error.mojom.dart' as network_error_mojom;
import 'package:mojo/services/network/public/interfaces/tcp_connected_socket.mojom.dart' as tcp_connected_socket_mojom;
import 'package:mojo/services/network/public/interfaces/tcp_server_socket.mojom.dart' as tcp_server_socket_mojom;


class TcpBoundSocketStartListeningParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  Object server = null;

  TcpBoundSocketStartListeningParams() : super(kStructSize);

  static TcpBoundSocketStartListeningParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TcpBoundSocketStartListeningParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TcpBoundSocketStartListeningParams result = new TcpBoundSocketStartListeningParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.server = decoder0.decodeInterfaceRequest(8, false, tcp_server_socket_mojom.TcpServerSocketStub.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInterfaceRequest(server, 8, false);
  }

  String toString() {
    return "TcpBoundSocketStartListeningParams("
           "server: $server" ")";
  }
}

class TcpBoundSocketStartListeningResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  network_error_mojom.NetworkError result = null;

  TcpBoundSocketStartListeningResponseParams() : super(kStructSize);

  static TcpBoundSocketStartListeningResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TcpBoundSocketStartListeningResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TcpBoundSocketStartListeningResponseParams result = new TcpBoundSocketStartListeningResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.result = network_error_mojom.NetworkError.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(result, 8, false);
  }

  String toString() {
    return "TcpBoundSocketStartListeningResponseParams("
           "result: $result" ")";
  }
}

class TcpBoundSocketConnectParams extends bindings.Struct {
  static const int kStructSize = 32;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  net_address_mojom.NetAddress remoteAddress = null;
  core.MojoDataPipeConsumer sendStream = null;
  core.MojoDataPipeProducer receiveStream = null;
  Object clientSocket = null;

  TcpBoundSocketConnectParams() : super(kStructSize);

  static TcpBoundSocketConnectParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TcpBoundSocketConnectParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TcpBoundSocketConnectParams result = new TcpBoundSocketConnectParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.remoteAddress = net_address_mojom.NetAddress.decode(decoder1);
    }
    {
      
      result.sendStream = decoder0.decodeConsumerHandle(16, false);
    }
    {
      
      result.receiveStream = decoder0.decodeProducerHandle(20, false);
    }
    {
      
      result.clientSocket = decoder0.decodeInterfaceRequest(24, false, tcp_connected_socket_mojom.TcpConnectedSocketStub.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(remoteAddress, 8, false);
    
    encoder0.encodeConsumerHandle(sendStream, 16, false);
    
    encoder0.encodeProducerHandle(receiveStream, 20, false);
    
    encoder0.encodeInterfaceRequest(clientSocket, 24, false);
  }

  String toString() {
    return "TcpBoundSocketConnectParams("
           "remoteAddress: $remoteAddress" ", "
           "sendStream: $sendStream" ", "
           "receiveStream: $receiveStream" ", "
           "clientSocket: $clientSocket" ")";
  }
}

class TcpBoundSocketConnectResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  network_error_mojom.NetworkError result = null;

  TcpBoundSocketConnectResponseParams() : super(kStructSize);

  static TcpBoundSocketConnectResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TcpBoundSocketConnectResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TcpBoundSocketConnectResponseParams result = new TcpBoundSocketConnectResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.result = network_error_mojom.NetworkError.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(result, 8, false);
  }

  String toString() {
    return "TcpBoundSocketConnectResponseParams("
           "result: $result" ")";
  }
}
const int kTcpBoundSocket_startListening_name = 0;
const int kTcpBoundSocket_connect_name = 1;

const String TcpBoundSocketName =
      'mojo::TcpBoundSocket';

abstract class TcpBoundSocket {
  Future<TcpBoundSocketStartListeningResponseParams> startListening(Object server,[Function responseFactory = null]);
  Future<TcpBoundSocketConnectResponseParams> connect(net_address_mojom.NetAddress remoteAddress,core.MojoDataPipeConsumer sendStream,core.MojoDataPipeProducer receiveStream,Object clientSocket,[Function responseFactory = null]);

}


class TcpBoundSocketProxyImpl extends bindings.Proxy {
  TcpBoundSocketProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  TcpBoundSocketProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  TcpBoundSocketProxyImpl.unbound() : super.unbound();

  static TcpBoundSocketProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TcpBoundSocketProxyImpl.fromEndpoint(endpoint);

  String get name => TcpBoundSocketName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kTcpBoundSocket_startListening_name:
        var r = TcpBoundSocketStartListeningResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          throw 'Message had unknown request Id: ${message.header.requestId}';
        }
        completerMap.remove(message.header.requestId);
        assert(!c.isCompleted);
        c.complete(r);
        break;
      case kTcpBoundSocket_connect_name:
        var r = TcpBoundSocketConnectResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          throw 'Message had unknown request Id: ${message.header.requestId}';
        }
        completerMap.remove(message.header.requestId);
        assert(!c.isCompleted);
        c.complete(r);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }

  String toString() {
    var superString = super.toString();
    return "TcpBoundSocketProxyImpl($superString)";
  }
}


class _TcpBoundSocketProxyCalls implements TcpBoundSocket {
  TcpBoundSocketProxyImpl _proxyImpl;

  _TcpBoundSocketProxyCalls(this._proxyImpl);
    Future<TcpBoundSocketStartListeningResponseParams> startListening(Object server,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new TcpBoundSocketStartListeningParams();
      params.server = server;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kTcpBoundSocket_startListening_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    Future<TcpBoundSocketConnectResponseParams> connect(net_address_mojom.NetAddress remoteAddress,core.MojoDataPipeConsumer sendStream,core.MojoDataPipeProducer receiveStream,Object clientSocket,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new TcpBoundSocketConnectParams();
      params.remoteAddress = remoteAddress;
      params.sendStream = sendStream;
      params.receiveStream = receiveStream;
      params.clientSocket = clientSocket;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kTcpBoundSocket_connect_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
}


class TcpBoundSocketProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  TcpBoundSocket ptr;
  final String name = TcpBoundSocketName;

  TcpBoundSocketProxy(TcpBoundSocketProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _TcpBoundSocketProxyCalls(proxyImpl);

  TcpBoundSocketProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new TcpBoundSocketProxyImpl.fromEndpoint(endpoint) {
    ptr = new _TcpBoundSocketProxyCalls(impl);
  }

  TcpBoundSocketProxy.fromHandle(core.MojoHandle handle) :
      impl = new TcpBoundSocketProxyImpl.fromHandle(handle) {
    ptr = new _TcpBoundSocketProxyCalls(impl);
  }

  TcpBoundSocketProxy.unbound() :
      impl = new TcpBoundSocketProxyImpl.unbound() {
    ptr = new _TcpBoundSocketProxyCalls(impl);
  }

  static TcpBoundSocketProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TcpBoundSocketProxy.fromEndpoint(endpoint);

  Future close({bool nodefer: false}) => impl.close(nodefer: nodefer);

  String toString() {
    return "TcpBoundSocketProxy($impl)";
  }
}


class TcpBoundSocketStub extends bindings.Stub {
  TcpBoundSocket _impl = null;

  TcpBoundSocketStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  TcpBoundSocketStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  TcpBoundSocketStub.unbound() : super.unbound();

  static TcpBoundSocketStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TcpBoundSocketStub.fromEndpoint(endpoint);

  static const String name = TcpBoundSocketName;


  TcpBoundSocketStartListeningResponseParams _TcpBoundSocketStartListeningResponseParamsFactory(network_error_mojom.NetworkError result) {
    var result = new TcpBoundSocketStartListeningResponseParams();
    result.result = result;
    return result;
  }
  TcpBoundSocketConnectResponseParams _TcpBoundSocketConnectResponseParamsFactory(network_error_mojom.NetworkError result) {
    var result = new TcpBoundSocketConnectResponseParams();
    result.result = result;
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_impl != null);
    switch (message.header.type) {
      case kTcpBoundSocket_startListening_name:
        var params = TcpBoundSocketStartListeningParams.deserialize(
            message.payload);
        return _impl.startListening(params.server,_TcpBoundSocketStartListeningResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kTcpBoundSocket_startListening_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kTcpBoundSocket_connect_name:
        var params = TcpBoundSocketConnectParams.deserialize(
            message.payload);
        return _impl.connect(params.remoteAddress,params.sendStream,params.receiveStream,params.clientSocket,_TcpBoundSocketConnectResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kTcpBoundSocket_connect_name,
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

  TcpBoundSocket get impl => _impl;
      set impl(TcpBoundSocket d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "TcpBoundSocketStub($superString)";
  }
}


PK     @[tFq���  �  G   mojo/services/network/public/interfaces/tcp_connected_socket.mojom.dart// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library tcp_connected_socket.mojom;

import 'dart:async';
import 'dart:mojo.bindings' as bindings;
import 'dart:mojo.core' as core;


const String TcpConnectedSocketName =
      'mojo::TcpConnectedSocket';

abstract class TcpConnectedSocket {

}


class TcpConnectedSocketProxyImpl extends bindings.Proxy {
  TcpConnectedSocketProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  TcpConnectedSocketProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  TcpConnectedSocketProxyImpl.unbound() : super.unbound();

  static TcpConnectedSocketProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TcpConnectedSocketProxyImpl.fromEndpoint(endpoint);

  String get name => TcpConnectedSocketName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }

  String toString() {
    var superString = super.toString();
    return "TcpConnectedSocketProxyImpl($superString)";
  }
}


class _TcpConnectedSocketProxyCalls implements TcpConnectedSocket {
  TcpConnectedSocketProxyImpl _proxyImpl;

  _TcpConnectedSocketProxyCalls(this._proxyImpl);
}


class TcpConnectedSocketProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  TcpConnectedSocket ptr;
  final String name = TcpConnectedSocketName;

  TcpConnectedSocketProxy(TcpConnectedSocketProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _TcpConnectedSocketProxyCalls(proxyImpl);

  TcpConnectedSocketProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new TcpConnectedSocketProxyImpl.fromEndpoint(endpoint) {
    ptr = new _TcpConnectedSocketProxyCalls(impl);
  }

  TcpConnectedSocketProxy.fromHandle(core.MojoHandle handle) :
      impl = new TcpConnectedSocketProxyImpl.fromHandle(handle) {
    ptr = new _TcpConnectedSocketProxyCalls(impl);
  }

  TcpConnectedSocketProxy.unbound() :
      impl = new TcpConnectedSocketProxyImpl.unbound() {
    ptr = new _TcpConnectedSocketProxyCalls(impl);
  }

  static TcpConnectedSocketProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TcpConnectedSocketProxy.fromEndpoint(endpoint);

  Future close({bool nodefer: false}) => impl.close(nodefer: nodefer);

  String toString() {
    return "TcpConnectedSocketProxy($impl)";
  }
}


class TcpConnectedSocketStub extends bindings.Stub {
  TcpConnectedSocket _impl = null;

  TcpConnectedSocketStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  TcpConnectedSocketStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  TcpConnectedSocketStub.unbound() : super.unbound();

  static TcpConnectedSocketStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TcpConnectedSocketStub.fromEndpoint(endpoint);

  static const String name = TcpConnectedSocketName;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_impl != null);
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  TcpConnectedSocket get impl => _impl;
      set impl(TcpConnectedSocket d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "TcpConnectedSocketStub($superString)";
  }
}


PK     @[tFj���%  �%  D   mojo/services/network/public/interfaces/tcp_server_socket.mojom.dart// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library tcp_server_socket.mojom;

import 'dart:async';
import 'dart:mojo.bindings' as bindings;
import 'dart:mojo.core' as core;
import 'package:mojo/services/network/public/interfaces/net_address.mojom.dart' as net_address_mojom;
import 'package:mojo/services/network/public/interfaces/network_error.mojom.dart' as network_error_mojom;
import 'package:mojo/services/network/public/interfaces/tcp_connected_socket.mojom.dart' as tcp_connected_socket_mojom;


class TcpServerSocketAcceptParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  core.MojoDataPipeConsumer sendStream = null;
  core.MojoDataPipeProducer receiveStream = null;
  Object clientSocket = null;

  TcpServerSocketAcceptParams() : super(kStructSize);

  static TcpServerSocketAcceptParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TcpServerSocketAcceptParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TcpServerSocketAcceptParams result = new TcpServerSocketAcceptParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.sendStream = decoder0.decodeConsumerHandle(8, false);
    }
    {
      
      result.receiveStream = decoder0.decodeProducerHandle(12, false);
    }
    {
      
      result.clientSocket = decoder0.decodeInterfaceRequest(16, false, tcp_connected_socket_mojom.TcpConnectedSocketStub.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeConsumerHandle(sendStream, 8, false);
    
    encoder0.encodeProducerHandle(receiveStream, 12, false);
    
    encoder0.encodeInterfaceRequest(clientSocket, 16, false);
  }

  String toString() {
    return "TcpServerSocketAcceptParams("
           "sendStream: $sendStream" ", "
           "receiveStream: $receiveStream" ", "
           "clientSocket: $clientSocket" ")";
  }
}

class TcpServerSocketAcceptResponseParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  network_error_mojom.NetworkError result = null;
  net_address_mojom.NetAddress remoteAddress = null;

  TcpServerSocketAcceptResponseParams() : super(kStructSize);

  static TcpServerSocketAcceptResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TcpServerSocketAcceptResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TcpServerSocketAcceptResponseParams result = new TcpServerSocketAcceptResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.result = network_error_mojom.NetworkError.decode(decoder1);
    }
    {
      
      var decoder1 = decoder0.decodePointer(16, true);
      result.remoteAddress = net_address_mojom.NetAddress.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(result, 8, false);
    
    encoder0.encodeStruct(remoteAddress, 16, true);
  }

  String toString() {
    return "TcpServerSocketAcceptResponseParams("
           "result: $result" ", "
           "remoteAddress: $remoteAddress" ")";
  }
}
const int kTcpServerSocket_accept_name = 0;

const String TcpServerSocketName =
      'mojo::TcpServerSocket';

abstract class TcpServerSocket {
  Future<TcpServerSocketAcceptResponseParams> accept(core.MojoDataPipeConsumer sendStream,core.MojoDataPipeProducer receiveStream,Object clientSocket,[Function responseFactory = null]);

}


class TcpServerSocketProxyImpl extends bindings.Proxy {
  TcpServerSocketProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  TcpServerSocketProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  TcpServerSocketProxyImpl.unbound() : super.unbound();

  static TcpServerSocketProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TcpServerSocketProxyImpl.fromEndpoint(endpoint);

  String get name => TcpServerSocketName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kTcpServerSocket_accept_name:
        var r = TcpServerSocketAcceptResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          throw 'Message had unknown request Id: ${message.header.requestId}';
        }
        completerMap.remove(message.header.requestId);
        assert(!c.isCompleted);
        c.complete(r);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }

  String toString() {
    var superString = super.toString();
    return "TcpServerSocketProxyImpl($superString)";
  }
}


class _TcpServerSocketProxyCalls implements TcpServerSocket {
  TcpServerSocketProxyImpl _proxyImpl;

  _TcpServerSocketProxyCalls(this._proxyImpl);
    Future<TcpServerSocketAcceptResponseParams> accept(core.MojoDataPipeConsumer sendStream,core.MojoDataPipeProducer receiveStream,Object clientSocket,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new TcpServerSocketAcceptParams();
      params.sendStream = sendStream;
      params.receiveStream = receiveStream;
      params.clientSocket = clientSocket;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kTcpServerSocket_accept_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
}


class TcpServerSocketProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  TcpServerSocket ptr;
  final String name = TcpServerSocketName;

  TcpServerSocketProxy(TcpServerSocketProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _TcpServerSocketProxyCalls(proxyImpl);

  TcpServerSocketProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new TcpServerSocketProxyImpl.fromEndpoint(endpoint) {
    ptr = new _TcpServerSocketProxyCalls(impl);
  }

  TcpServerSocketProxy.fromHandle(core.MojoHandle handle) :
      impl = new TcpServerSocketProxyImpl.fromHandle(handle) {
    ptr = new _TcpServerSocketProxyCalls(impl);
  }

  TcpServerSocketProxy.unbound() :
      impl = new TcpServerSocketProxyImpl.unbound() {
    ptr = new _TcpServerSocketProxyCalls(impl);
  }

  static TcpServerSocketProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TcpServerSocketProxy.fromEndpoint(endpoint);

  Future close({bool nodefer: false}) => impl.close(nodefer: nodefer);

  String toString() {
    return "TcpServerSocketProxy($impl)";
  }
}


class TcpServerSocketStub extends bindings.Stub {
  TcpServerSocket _impl = null;

  TcpServerSocketStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  TcpServerSocketStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  TcpServerSocketStub.unbound() : super.unbound();

  static TcpServerSocketStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TcpServerSocketStub.fromEndpoint(endpoint);

  static const String name = TcpServerSocketName;


  TcpServerSocketAcceptResponseParams _TcpServerSocketAcceptResponseParamsFactory(network_error_mojom.NetworkError result, net_address_mojom.NetAddress remoteAddress) {
    var result = new TcpServerSocketAcceptResponseParams();
    result.result = result;
    result.remoteAddress = remoteAddress;
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_impl != null);
    switch (message.header.type) {
      case kTcpServerSocket_accept_name:
        var params = TcpServerSocketAcceptParams.deserialize(
            message.payload);
        return _impl.accept(params.sendStream,params.receiveStream,params.clientSocket,_TcpServerSocketAcceptResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kTcpServerSocket_accept_name,
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

  TcpServerSocket get impl => _impl;
      set impl(TcpServerSocket d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "TcpServerSocketStub($superString)";
  }
}


PK     @[tF��,uʯ  ʯ  =   mojo/services/network/public/interfaces/udp_socket.mojom.dart// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library udp_socket.mojom;

import 'dart:async';
import 'dart:mojo.bindings' as bindings;
import 'dart:mojo.core' as core;
import 'package:mojo/services/network/public/interfaces/net_address.mojom.dart' as net_address_mojom;
import 'package:mojo/services/network/public/interfaces/network_error.mojom.dart' as network_error_mojom;


class UdpSocketAllowAddressReuseParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  UdpSocketAllowAddressReuseParams() : super(kStructSize);

  static UdpSocketAllowAddressReuseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static UdpSocketAllowAddressReuseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    UdpSocketAllowAddressReuseParams result = new UdpSocketAllowAddressReuseParams();

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
    return "UdpSocketAllowAddressReuseParams("")";
  }
}

class UdpSocketAllowAddressReuseResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  network_error_mojom.NetworkError result = null;

  UdpSocketAllowAddressReuseResponseParams() : super(kStructSize);

  static UdpSocketAllowAddressReuseResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static UdpSocketAllowAddressReuseResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    UdpSocketAllowAddressReuseResponseParams result = new UdpSocketAllowAddressReuseResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.result = network_error_mojom.NetworkError.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(result, 8, false);
  }

  String toString() {
    return "UdpSocketAllowAddressReuseResponseParams("
           "result: $result" ")";
  }
}

class UdpSocketBindParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  net_address_mojom.NetAddress addr = null;

  UdpSocketBindParams() : super(kStructSize);

  static UdpSocketBindParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static UdpSocketBindParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    UdpSocketBindParams result = new UdpSocketBindParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.addr = net_address_mojom.NetAddress.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(addr, 8, false);
  }

  String toString() {
    return "UdpSocketBindParams("
           "addr: $addr" ")";
  }
}

class UdpSocketBindResponseParams extends bindings.Struct {
  static const int kStructSize = 32;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  network_error_mojom.NetworkError result = null;
  net_address_mojom.NetAddress boundAddr = null;
  Object receiver = null;

  UdpSocketBindResponseParams() : super(kStructSize);

  static UdpSocketBindResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static UdpSocketBindResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    UdpSocketBindResponseParams result = new UdpSocketBindResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.result = network_error_mojom.NetworkError.decode(decoder1);
    }
    {
      
      var decoder1 = decoder0.decodePointer(16, true);
      result.boundAddr = net_address_mojom.NetAddress.decode(decoder1);
    }
    {
      
      result.receiver = decoder0.decodeInterfaceRequest(24, true, UdpSocketReceiverStub.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(result, 8, false);
    
    encoder0.encodeStruct(boundAddr, 16, true);
    
    encoder0.encodeInterfaceRequest(receiver, 24, true);
  }

  String toString() {
    return "UdpSocketBindResponseParams("
           "result: $result" ", "
           "boundAddr: $boundAddr" ", "
           "receiver: $receiver" ")";
  }
}

class UdpSocketConnectParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  net_address_mojom.NetAddress remoteAddr = null;

  UdpSocketConnectParams() : super(kStructSize);

  static UdpSocketConnectParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static UdpSocketConnectParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    UdpSocketConnectParams result = new UdpSocketConnectParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.remoteAddr = net_address_mojom.NetAddress.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(remoteAddr, 8, false);
  }

  String toString() {
    return "UdpSocketConnectParams("
           "remoteAddr: $remoteAddr" ")";
  }
}

class UdpSocketConnectResponseParams extends bindings.Struct {
  static const int kStructSize = 32;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  network_error_mojom.NetworkError result = null;
  net_address_mojom.NetAddress localAddr = null;
  Object receiver = null;

  UdpSocketConnectResponseParams() : super(kStructSize);

  static UdpSocketConnectResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static UdpSocketConnectResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    UdpSocketConnectResponseParams result = new UdpSocketConnectResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.result = network_error_mojom.NetworkError.decode(decoder1);
    }
    {
      
      var decoder1 = decoder0.decodePointer(16, true);
      result.localAddr = net_address_mojom.NetAddress.decode(decoder1);
    }
    {
      
      result.receiver = decoder0.decodeInterfaceRequest(24, true, UdpSocketReceiverStub.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(result, 8, false);
    
    encoder0.encodeStruct(localAddr, 16, true);
    
    encoder0.encodeInterfaceRequest(receiver, 24, true);
  }

  String toString() {
    return "UdpSocketConnectResponseParams("
           "result: $result" ", "
           "localAddr: $localAddr" ", "
           "receiver: $receiver" ")";
  }
}

class UdpSocketSetSendBufferSizeParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  int size = 0;

  UdpSocketSetSendBufferSizeParams() : super(kStructSize);

  static UdpSocketSetSendBufferSizeParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static UdpSocketSetSendBufferSizeParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    UdpSocketSetSendBufferSizeParams result = new UdpSocketSetSendBufferSizeParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.size = decoder0.decodeUint32(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint32(size, 8);
  }

  String toString() {
    return "UdpSocketSetSendBufferSizeParams("
           "size: $size" ")";
  }
}

class UdpSocketSetSendBufferSizeResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  network_error_mojom.NetworkError result = null;

  UdpSocketSetSendBufferSizeResponseParams() : super(kStructSize);

  static UdpSocketSetSendBufferSizeResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static UdpSocketSetSendBufferSizeResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    UdpSocketSetSendBufferSizeResponseParams result = new UdpSocketSetSendBufferSizeResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.result = network_error_mojom.NetworkError.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(result, 8, false);
  }

  String toString() {
    return "UdpSocketSetSendBufferSizeResponseParams("
           "result: $result" ")";
  }
}

class UdpSocketSetReceiveBufferSizeParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  int size = 0;

  UdpSocketSetReceiveBufferSizeParams() : super(kStructSize);

  static UdpSocketSetReceiveBufferSizeParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static UdpSocketSetReceiveBufferSizeParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    UdpSocketSetReceiveBufferSizeParams result = new UdpSocketSetReceiveBufferSizeParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.size = decoder0.decodeUint32(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint32(size, 8);
  }

  String toString() {
    return "UdpSocketSetReceiveBufferSizeParams("
           "size: $size" ")";
  }
}

class UdpSocketSetReceiveBufferSizeResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  network_error_mojom.NetworkError result = null;

  UdpSocketSetReceiveBufferSizeResponseParams() : super(kStructSize);

  static UdpSocketSetReceiveBufferSizeResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static UdpSocketSetReceiveBufferSizeResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    UdpSocketSetReceiveBufferSizeResponseParams result = new UdpSocketSetReceiveBufferSizeResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.result = network_error_mojom.NetworkError.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(result, 8, false);
  }

  String toString() {
    return "UdpSocketSetReceiveBufferSizeResponseParams("
           "result: $result" ")";
  }
}

class UdpSocketNegotiateMaxPendingSendRequestsParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  int requestedSize = 0;

  UdpSocketNegotiateMaxPendingSendRequestsParams() : super(kStructSize);

  static UdpSocketNegotiateMaxPendingSendRequestsParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static UdpSocketNegotiateMaxPendingSendRequestsParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    UdpSocketNegotiateMaxPendingSendRequestsParams result = new UdpSocketNegotiateMaxPendingSendRequestsParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.requestedSize = decoder0.decodeUint32(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint32(requestedSize, 8);
  }

  String toString() {
    return "UdpSocketNegotiateMaxPendingSendRequestsParams("
           "requestedSize: $requestedSize" ")";
  }
}

class UdpSocketNegotiateMaxPendingSendRequestsResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  int actualSize = 0;

  UdpSocketNegotiateMaxPendingSendRequestsResponseParams() : super(kStructSize);

  static UdpSocketNegotiateMaxPendingSendRequestsResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static UdpSocketNegotiateMaxPendingSendRequestsResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    UdpSocketNegotiateMaxPendingSendRequestsResponseParams result = new UdpSocketNegotiateMaxPendingSendRequestsResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.actualSize = decoder0.decodeUint32(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint32(actualSize, 8);
  }

  String toString() {
    return "UdpSocketNegotiateMaxPendingSendRequestsResponseParams("
           "actualSize: $actualSize" ")";
  }
}

class UdpSocketReceiveMoreParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  int datagramNumber = 0;

  UdpSocketReceiveMoreParams() : super(kStructSize);

  static UdpSocketReceiveMoreParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static UdpSocketReceiveMoreParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    UdpSocketReceiveMoreParams result = new UdpSocketReceiveMoreParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.datagramNumber = decoder0.decodeUint32(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint32(datagramNumber, 8);
  }

  String toString() {
    return "UdpSocketReceiveMoreParams("
           "datagramNumber: $datagramNumber" ")";
  }
}

class UdpSocketSendToParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  net_address_mojom.NetAddress destAddr = null;
  List<int> data = null;

  UdpSocketSendToParams() : super(kStructSize);

  static UdpSocketSendToParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static UdpSocketSendToParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    UdpSocketSendToParams result = new UdpSocketSendToParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, true);
      result.destAddr = net_address_mojom.NetAddress.decode(decoder1);
    }
    {
      
      result.data = decoder0.decodeUint8Array(16, bindings.kNothingNullable, bindings.kUnspecifiedArrayLength);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(destAddr, 8, true);
    
    encoder0.encodeUint8Array(data, 16, bindings.kNothingNullable, bindings.kUnspecifiedArrayLength);
  }

  String toString() {
    return "UdpSocketSendToParams("
           "destAddr: $destAddr" ", "
           "data: $data" ")";
  }
}

class UdpSocketSendToResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  network_error_mojom.NetworkError result = null;

  UdpSocketSendToResponseParams() : super(kStructSize);

  static UdpSocketSendToResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static UdpSocketSendToResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    UdpSocketSendToResponseParams result = new UdpSocketSendToResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.result = network_error_mojom.NetworkError.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(result, 8, false);
  }

  String toString() {
    return "UdpSocketSendToResponseParams("
           "result: $result" ")";
  }
}

class UdpSocketReceiverOnReceivedParams extends bindings.Struct {
  static const int kStructSize = 32;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  network_error_mojom.NetworkError result = null;
  net_address_mojom.NetAddress srcAddr = null;
  List<int> data = null;

  UdpSocketReceiverOnReceivedParams() : super(kStructSize);

  static UdpSocketReceiverOnReceivedParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static UdpSocketReceiverOnReceivedParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    UdpSocketReceiverOnReceivedParams result = new UdpSocketReceiverOnReceivedParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.result = network_error_mojom.NetworkError.decode(decoder1);
    }
    {
      
      var decoder1 = decoder0.decodePointer(16, true);
      result.srcAddr = net_address_mojom.NetAddress.decode(decoder1);
    }
    {
      
      result.data = decoder0.decodeUint8Array(24, bindings.kArrayNullable, bindings.kUnspecifiedArrayLength);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(result, 8, false);
    
    encoder0.encodeStruct(srcAddr, 16, true);
    
    encoder0.encodeUint8Array(data, 24, bindings.kArrayNullable, bindings.kUnspecifiedArrayLength);
  }

  String toString() {
    return "UdpSocketReceiverOnReceivedParams("
           "result: $result" ", "
           "srcAddr: $srcAddr" ", "
           "data: $data" ")";
  }
}
const int kUdpSocket_allowAddressReuse_name = 0;
const int kUdpSocket_bind_name = 1;
const int kUdpSocket_connect_name = 2;
const int kUdpSocket_setSendBufferSize_name = 3;
const int kUdpSocket_setReceiveBufferSize_name = 4;
const int kUdpSocket_negotiateMaxPendingSendRequests_name = 5;
const int kUdpSocket_receiveMore_name = 6;
const int kUdpSocket_sendTo_name = 7;

const String UdpSocketName =
      'mojo::UdpSocket';

abstract class UdpSocket {
  Future<UdpSocketAllowAddressReuseResponseParams> allowAddressReuse([Function responseFactory = null]);
  Future<UdpSocketBindResponseParams> bind(net_address_mojom.NetAddress addr,[Function responseFactory = null]);
  Future<UdpSocketConnectResponseParams> connect(net_address_mojom.NetAddress remoteAddr,[Function responseFactory = null]);
  Future<UdpSocketSetSendBufferSizeResponseParams> setSendBufferSize(int size,[Function responseFactory = null]);
  Future<UdpSocketSetReceiveBufferSizeResponseParams> setReceiveBufferSize(int size,[Function responseFactory = null]);
  Future<UdpSocketNegotiateMaxPendingSendRequestsResponseParams> negotiateMaxPendingSendRequests(int requestedSize,[Function responseFactory = null]);
  void receiveMore(int datagramNumber);
  Future<UdpSocketSendToResponseParams> sendTo(net_address_mojom.NetAddress destAddr,List<int> data,[Function responseFactory = null]);

}


class UdpSocketProxyImpl extends bindings.Proxy {
  UdpSocketProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  UdpSocketProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  UdpSocketProxyImpl.unbound() : super.unbound();

  static UdpSocketProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new UdpSocketProxyImpl.fromEndpoint(endpoint);

  String get name => UdpSocketName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kUdpSocket_allowAddressReuse_name:
        var r = UdpSocketAllowAddressReuseResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          throw 'Message had unknown request Id: ${message.header.requestId}';
        }
        completerMap.remove(message.header.requestId);
        assert(!c.isCompleted);
        c.complete(r);
        break;
      case kUdpSocket_bind_name:
        var r = UdpSocketBindResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          throw 'Message had unknown request Id: ${message.header.requestId}';
        }
        completerMap.remove(message.header.requestId);
        assert(!c.isCompleted);
        c.complete(r);
        break;
      case kUdpSocket_connect_name:
        var r = UdpSocketConnectResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          throw 'Message had unknown request Id: ${message.header.requestId}';
        }
        completerMap.remove(message.header.requestId);
        assert(!c.isCompleted);
        c.complete(r);
        break;
      case kUdpSocket_setSendBufferSize_name:
        var r = UdpSocketSetSendBufferSizeResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          throw 'Message had unknown request Id: ${message.header.requestId}';
        }
        completerMap.remove(message.header.requestId);
        assert(!c.isCompleted);
        c.complete(r);
        break;
      case kUdpSocket_setReceiveBufferSize_name:
        var r = UdpSocketSetReceiveBufferSizeResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          throw 'Message had unknown request Id: ${message.header.requestId}';
        }
        completerMap.remove(message.header.requestId);
        assert(!c.isCompleted);
        c.complete(r);
        break;
      case kUdpSocket_negotiateMaxPendingSendRequests_name:
        var r = UdpSocketNegotiateMaxPendingSendRequestsResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          throw 'Message had unknown request Id: ${message.header.requestId}';
        }
        completerMap.remove(message.header.requestId);
        assert(!c.isCompleted);
        c.complete(r);
        break;
      case kUdpSocket_sendTo_name:
        var r = UdpSocketSendToResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          throw 'Message had unknown request Id: ${message.header.requestId}';
        }
        completerMap.remove(message.header.requestId);
        assert(!c.isCompleted);
        c.complete(r);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }

  String toString() {
    var superString = super.toString();
    return "UdpSocketProxyImpl($superString)";
  }
}


class _UdpSocketProxyCalls implements UdpSocket {
  UdpSocketProxyImpl _proxyImpl;

  _UdpSocketProxyCalls(this._proxyImpl);
    Future<UdpSocketAllowAddressReuseResponseParams> allowAddressReuse([Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new UdpSocketAllowAddressReuseParams();
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kUdpSocket_allowAddressReuse_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    Future<UdpSocketBindResponseParams> bind(net_address_mojom.NetAddress addr,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new UdpSocketBindParams();
      params.addr = addr;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kUdpSocket_bind_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    Future<UdpSocketConnectResponseParams> connect(net_address_mojom.NetAddress remoteAddr,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new UdpSocketConnectParams();
      params.remoteAddr = remoteAddr;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kUdpSocket_connect_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    Future<UdpSocketSetSendBufferSizeResponseParams> setSendBufferSize(int size,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new UdpSocketSetSendBufferSizeParams();
      params.size = size;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kUdpSocket_setSendBufferSize_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    Future<UdpSocketSetReceiveBufferSizeResponseParams> setReceiveBufferSize(int size,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new UdpSocketSetReceiveBufferSizeParams();
      params.size = size;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kUdpSocket_setReceiveBufferSize_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    Future<UdpSocketNegotiateMaxPendingSendRequestsResponseParams> negotiateMaxPendingSendRequests(int requestedSize,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new UdpSocketNegotiateMaxPendingSendRequestsParams();
      params.requestedSize = requestedSize;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kUdpSocket_negotiateMaxPendingSendRequests_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    void receiveMore(int datagramNumber) {
      assert(_proxyImpl.isBound);
      var params = new UdpSocketReceiveMoreParams();
      params.datagramNumber = datagramNumber;
      _proxyImpl.sendMessage(params, kUdpSocket_receiveMore_name);
    }
  
    Future<UdpSocketSendToResponseParams> sendTo(net_address_mojom.NetAddress destAddr,List<int> data,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new UdpSocketSendToParams();
      params.destAddr = destAddr;
      params.data = data;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kUdpSocket_sendTo_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
}


class UdpSocketProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  UdpSocket ptr;
  final String name = UdpSocketName;

  UdpSocketProxy(UdpSocketProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _UdpSocketProxyCalls(proxyImpl);

  UdpSocketProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new UdpSocketProxyImpl.fromEndpoint(endpoint) {
    ptr = new _UdpSocketProxyCalls(impl);
  }

  UdpSocketProxy.fromHandle(core.MojoHandle handle) :
      impl = new UdpSocketProxyImpl.fromHandle(handle) {
    ptr = new _UdpSocketProxyCalls(impl);
  }

  UdpSocketProxy.unbound() :
      impl = new UdpSocketProxyImpl.unbound() {
    ptr = new _UdpSocketProxyCalls(impl);
  }

  static UdpSocketProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new UdpSocketProxy.fromEndpoint(endpoint);

  Future close({bool nodefer: false}) => impl.close(nodefer: nodefer);

  String toString() {
    return "UdpSocketProxy($impl)";
  }
}


class UdpSocketStub extends bindings.Stub {
  UdpSocket _impl = null;

  UdpSocketStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  UdpSocketStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  UdpSocketStub.unbound() : super.unbound();

  static UdpSocketStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new UdpSocketStub.fromEndpoint(endpoint);

  static const String name = UdpSocketName;


  UdpSocketAllowAddressReuseResponseParams _UdpSocketAllowAddressReuseResponseParamsFactory(network_error_mojom.NetworkError result) {
    var result = new UdpSocketAllowAddressReuseResponseParams();
    result.result = result;
    return result;
  }
  UdpSocketBindResponseParams _UdpSocketBindResponseParamsFactory(network_error_mojom.NetworkError result, net_address_mojom.NetAddress boundAddr, Object receiver) {
    var result = new UdpSocketBindResponseParams();
    result.result = result;
    result.boundAddr = boundAddr;
    result.receiver = receiver;
    return result;
  }
  UdpSocketConnectResponseParams _UdpSocketConnectResponseParamsFactory(network_error_mojom.NetworkError result, net_address_mojom.NetAddress localAddr, Object receiver) {
    var result = new UdpSocketConnectResponseParams();
    result.result = result;
    result.localAddr = localAddr;
    result.receiver = receiver;
    return result;
  }
  UdpSocketSetSendBufferSizeResponseParams _UdpSocketSetSendBufferSizeResponseParamsFactory(network_error_mojom.NetworkError result) {
    var result = new UdpSocketSetSendBufferSizeResponseParams();
    result.result = result;
    return result;
  }
  UdpSocketSetReceiveBufferSizeResponseParams _UdpSocketSetReceiveBufferSizeResponseParamsFactory(network_error_mojom.NetworkError result) {
    var result = new UdpSocketSetReceiveBufferSizeResponseParams();
    result.result = result;
    return result;
  }
  UdpSocketNegotiateMaxPendingSendRequestsResponseParams _UdpSocketNegotiateMaxPendingSendRequestsResponseParamsFactory(int actualSize) {
    var result = new UdpSocketNegotiateMaxPendingSendRequestsResponseParams();
    result.actualSize = actualSize;
    return result;
  }
  UdpSocketSendToResponseParams _UdpSocketSendToResponseParamsFactory(network_error_mojom.NetworkError result) {
    var result = new UdpSocketSendToResponseParams();
    result.result = result;
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_impl != null);
    switch (message.header.type) {
      case kUdpSocket_allowAddressReuse_name:
        var params = UdpSocketAllowAddressReuseParams.deserialize(
            message.payload);
        return _impl.allowAddressReuse(_UdpSocketAllowAddressReuseResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kUdpSocket_allowAddressReuse_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kUdpSocket_bind_name:
        var params = UdpSocketBindParams.deserialize(
            message.payload);
        return _impl.bind(params.addr,_UdpSocketBindResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kUdpSocket_bind_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kUdpSocket_connect_name:
        var params = UdpSocketConnectParams.deserialize(
            message.payload);
        return _impl.connect(params.remoteAddr,_UdpSocketConnectResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kUdpSocket_connect_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kUdpSocket_setSendBufferSize_name:
        var params = UdpSocketSetSendBufferSizeParams.deserialize(
            message.payload);
        return _impl.setSendBufferSize(params.size,_UdpSocketSetSendBufferSizeResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kUdpSocket_setSendBufferSize_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kUdpSocket_setReceiveBufferSize_name:
        var params = UdpSocketSetReceiveBufferSizeParams.deserialize(
            message.payload);
        return _impl.setReceiveBufferSize(params.size,_UdpSocketSetReceiveBufferSizeResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kUdpSocket_setReceiveBufferSize_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kUdpSocket_negotiateMaxPendingSendRequests_name:
        var params = UdpSocketNegotiateMaxPendingSendRequestsParams.deserialize(
            message.payload);
        return _impl.negotiateMaxPendingSendRequests(params.requestedSize,_UdpSocketNegotiateMaxPendingSendRequestsResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kUdpSocket_negotiateMaxPendingSendRequests_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kUdpSocket_receiveMore_name:
        var params = UdpSocketReceiveMoreParams.deserialize(
            message.payload);
        _impl.receiveMore(params.datagramNumber);
        break;
      case kUdpSocket_sendTo_name:
        var params = UdpSocketSendToParams.deserialize(
            message.payload);
        return _impl.sendTo(params.destAddr,params.data,_UdpSocketSendToResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kUdpSocket_sendTo_name,
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

  UdpSocket get impl => _impl;
      set impl(UdpSocket d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "UdpSocketStub($superString)";
  }
}

const int kUdpSocketReceiver_onReceived_name = 0;

const String UdpSocketReceiverName =
      'mojo::UdpSocketReceiver';

abstract class UdpSocketReceiver {
  void onReceived(network_error_mojom.NetworkError result, net_address_mojom.NetAddress srcAddr, List<int> data);

}


class UdpSocketReceiverProxyImpl extends bindings.Proxy {
  UdpSocketReceiverProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  UdpSocketReceiverProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  UdpSocketReceiverProxyImpl.unbound() : super.unbound();

  static UdpSocketReceiverProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new UdpSocketReceiverProxyImpl.fromEndpoint(endpoint);

  String get name => UdpSocketReceiverName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }

  String toString() {
    var superString = super.toString();
    return "UdpSocketReceiverProxyImpl($superString)";
  }
}


class _UdpSocketReceiverProxyCalls implements UdpSocketReceiver {
  UdpSocketReceiverProxyImpl _proxyImpl;

  _UdpSocketReceiverProxyCalls(this._proxyImpl);
    void onReceived(network_error_mojom.NetworkError result, net_address_mojom.NetAddress srcAddr, List<int> data) {
      assert(_proxyImpl.isBound);
      var params = new UdpSocketReceiverOnReceivedParams();
      params.result = result;
      params.srcAddr = srcAddr;
      params.data = data;
      _proxyImpl.sendMessage(params, kUdpSocketReceiver_onReceived_name);
    }
  
}


class UdpSocketReceiverProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  UdpSocketReceiver ptr;
  final String name = UdpSocketReceiverName;

  UdpSocketReceiverProxy(UdpSocketReceiverProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _UdpSocketReceiverProxyCalls(proxyImpl);

  UdpSocketReceiverProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new UdpSocketReceiverProxyImpl.fromEndpoint(endpoint) {
    ptr = new _UdpSocketReceiverProxyCalls(impl);
  }

  UdpSocketReceiverProxy.fromHandle(core.MojoHandle handle) :
      impl = new UdpSocketReceiverProxyImpl.fromHandle(handle) {
    ptr = new _UdpSocketReceiverProxyCalls(impl);
  }

  UdpSocketReceiverProxy.unbound() :
      impl = new UdpSocketReceiverProxyImpl.unbound() {
    ptr = new _UdpSocketReceiverProxyCalls(impl);
  }

  static UdpSocketReceiverProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new UdpSocketReceiverProxy.fromEndpoint(endpoint);

  Future close({bool nodefer: false}) => impl.close(nodefer: nodefer);

  String toString() {
    return "UdpSocketReceiverProxy($impl)";
  }
}


class UdpSocketReceiverStub extends bindings.Stub {
  UdpSocketReceiver _impl = null;

  UdpSocketReceiverStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  UdpSocketReceiverStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  UdpSocketReceiverStub.unbound() : super.unbound();

  static UdpSocketReceiverStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new UdpSocketReceiverStub.fromEndpoint(endpoint);

  static const String name = UdpSocketReceiverName;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_impl != null);
    switch (message.header.type) {
      case kUdpSocketReceiver_onReceived_name:
        var params = UdpSocketReceiverOnReceivedParams.deserialize(
            message.payload);
        _impl.onReceived(params.result, params.srcAddr, params.data);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  UdpSocketReceiver get impl => _impl;
      set impl(UdpSocketReceiver d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "UdpSocketReceiverStub($superString)";
  }
}


PK     @[tF�%���_  �_  =   mojo/services/network/public/interfaces/url_loader.mojom.dart// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library url_loader.mojom;

import 'dart:async';
import 'dart:mojo.bindings' as bindings;
import 'dart:mojo.core' as core;
import 'package:mojo/services/network/public/interfaces/network_error.mojom.dart' as network_error_mojom;


class UrlRequest extends bindings.Struct {
  static const int kStructSize = 48;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  String url = null;
  String method = "GET";
  List<String> headers = null;
  List<core.MojoDataPipeConsumer> body = null;
  int responseBodyBufferSize = 0;
  bool autoFollowRedirects = false;
  bool bypassCache = false;

  UrlRequest() : super(kStructSize);

  static UrlRequest deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static UrlRequest decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    UrlRequest result = new UrlRequest();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.url = decoder0.decodeString(8, false);
    }
    {
      
      result.method = decoder0.decodeString(16, false);
    }
    {
      
      var decoder1 = decoder0.decodePointer(24, true);
      if (decoder1 == null) {
        result.headers = null;
      } else {
        var si1 = decoder1.decodeDataHeaderForPointerArray(bindings.kUnspecifiedArrayLength);
        result.headers = new List<String>(si1.numElements);
        for (int i1 = 0; i1 < si1.numElements; ++i1) {
          
          result.headers[i1] = decoder1.decodeString(bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i1, false);
        }
      }
    }
    {
      
      result.body = decoder0.decodeConsumerHandleArray(32, bindings.kArrayNullable, bindings.kUnspecifiedArrayLength);
    }
    {
      
      result.responseBodyBufferSize = decoder0.decodeUint32(40);
    }
    {
      
      result.autoFollowRedirects = decoder0.decodeBool(44, 0);
    }
    {
      
      result.bypassCache = decoder0.decodeBool(44, 1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeString(url, 8, false);
    
    encoder0.encodeString(method, 16, false);
    
    if (headers == null) {
      encoder0.encodeNullPointer(24, true);
    } else {
      var encoder1 = encoder0.encodePointerArray(headers.length, 24, bindings.kUnspecifiedArrayLength);
      for (int i0 = 0; i0 < headers.length; ++i0) {
        
        encoder1.encodeString(headers[i0], bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i0, false);
      }
    }
    
    encoder0.encodeConsumerHandleArray(body, 32, bindings.kArrayNullable, bindings.kUnspecifiedArrayLength);
    
    encoder0.encodeUint32(responseBodyBufferSize, 40);
    
    encoder0.encodeBool(autoFollowRedirects, 44, 0);
    
    encoder0.encodeBool(bypassCache, 44, 1);
  }

  String toString() {
    return "UrlRequest("
           "url: $url" ", "
           "method: $method" ", "
           "headers: $headers" ", "
           "body: $body" ", "
           "responseBodyBufferSize: $responseBodyBufferSize" ", "
           "autoFollowRedirects: $autoFollowRedirects" ", "
           "bypassCache: $bypassCache" ")";
  }
}

class UrlResponse extends bindings.Struct {
  static const int kStructSize = 80;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  network_error_mojom.NetworkError error = null;
  core.MojoDataPipeConsumer body = null;
  int statusCode = 0;
  String url = null;
  String statusLine = null;
  List<String> headers = null;
  String mimeType = null;
  String charset = null;
  String redirectMethod = null;
  String redirectUrl = null;

  UrlResponse() : super(kStructSize);

  static UrlResponse deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static UrlResponse decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    UrlResponse result = new UrlResponse();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, true);
      result.error = network_error_mojom.NetworkError.decode(decoder1);
    }
    {
      
      result.body = decoder0.decodeConsumerHandle(16, true);
    }
    {
      
      result.statusCode = decoder0.decodeUint32(20);
    }
    {
      
      result.url = decoder0.decodeString(24, true);
    }
    {
      
      result.statusLine = decoder0.decodeString(32, true);
    }
    {
      
      var decoder1 = decoder0.decodePointer(40, true);
      if (decoder1 == null) {
        result.headers = null;
      } else {
        var si1 = decoder1.decodeDataHeaderForPointerArray(bindings.kUnspecifiedArrayLength);
        result.headers = new List<String>(si1.numElements);
        for (int i1 = 0; i1 < si1.numElements; ++i1) {
          
          result.headers[i1] = decoder1.decodeString(bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i1, false);
        }
      }
    }
    {
      
      result.mimeType = decoder0.decodeString(48, true);
    }
    {
      
      result.charset = decoder0.decodeString(56, true);
    }
    {
      
      result.redirectMethod = decoder0.decodeString(64, true);
    }
    {
      
      result.redirectUrl = decoder0.decodeString(72, true);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(error, 8, true);
    
    encoder0.encodeConsumerHandle(body, 16, true);
    
    encoder0.encodeUint32(statusCode, 20);
    
    encoder0.encodeString(url, 24, true);
    
    encoder0.encodeString(statusLine, 32, true);
    
    if (headers == null) {
      encoder0.encodeNullPointer(40, true);
    } else {
      var encoder1 = encoder0.encodePointerArray(headers.length, 40, bindings.kUnspecifiedArrayLength);
      for (int i0 = 0; i0 < headers.length; ++i0) {
        
        encoder1.encodeString(headers[i0], bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i0, false);
      }
    }
    
    encoder0.encodeString(mimeType, 48, true);
    
    encoder0.encodeString(charset, 56, true);
    
    encoder0.encodeString(redirectMethod, 64, true);
    
    encoder0.encodeString(redirectUrl, 72, true);
  }

  String toString() {
    return "UrlResponse("
           "error: $error" ", "
           "body: $body" ", "
           "statusCode: $statusCode" ", "
           "url: $url" ", "
           "statusLine: $statusLine" ", "
           "headers: $headers" ", "
           "mimeType: $mimeType" ", "
           "charset: $charset" ", "
           "redirectMethod: $redirectMethod" ", "
           "redirectUrl: $redirectUrl" ")";
  }
}

class UrlLoaderStatus extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  network_error_mojom.NetworkError error = null;
  bool isLoading = false;

  UrlLoaderStatus() : super(kStructSize);

  static UrlLoaderStatus deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static UrlLoaderStatus decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    UrlLoaderStatus result = new UrlLoaderStatus();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, true);
      result.error = network_error_mojom.NetworkError.decode(decoder1);
    }
    {
      
      result.isLoading = decoder0.decodeBool(16, 0);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(error, 8, true);
    
    encoder0.encodeBool(isLoading, 16, 0);
  }

  String toString() {
    return "UrlLoaderStatus("
           "error: $error" ", "
           "isLoading: $isLoading" ")";
  }
}

class UrlLoaderStartParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  UrlRequest request = null;

  UrlLoaderStartParams() : super(kStructSize);

  static UrlLoaderStartParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static UrlLoaderStartParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    UrlLoaderStartParams result = new UrlLoaderStartParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.request = UrlRequest.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(request, 8, false);
  }

  String toString() {
    return "UrlLoaderStartParams("
           "request: $request" ")";
  }
}

class UrlLoaderStartResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  UrlResponse response = null;

  UrlLoaderStartResponseParams() : super(kStructSize);

  static UrlLoaderStartResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static UrlLoaderStartResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    UrlLoaderStartResponseParams result = new UrlLoaderStartResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.response = UrlResponse.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(response, 8, false);
  }

  String toString() {
    return "UrlLoaderStartResponseParams("
           "response: $response" ")";
  }
}

class UrlLoaderFollowRedirectParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  UrlLoaderFollowRedirectParams() : super(kStructSize);

  static UrlLoaderFollowRedirectParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static UrlLoaderFollowRedirectParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    UrlLoaderFollowRedirectParams result = new UrlLoaderFollowRedirectParams();

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
    return "UrlLoaderFollowRedirectParams("")";
  }
}

class UrlLoaderFollowRedirectResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  UrlResponse response = null;

  UrlLoaderFollowRedirectResponseParams() : super(kStructSize);

  static UrlLoaderFollowRedirectResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static UrlLoaderFollowRedirectResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    UrlLoaderFollowRedirectResponseParams result = new UrlLoaderFollowRedirectResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.response = UrlResponse.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(response, 8, false);
  }

  String toString() {
    return "UrlLoaderFollowRedirectResponseParams("
           "response: $response" ")";
  }
}

class UrlLoaderQueryStatusParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  UrlLoaderQueryStatusParams() : super(kStructSize);

  static UrlLoaderQueryStatusParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static UrlLoaderQueryStatusParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    UrlLoaderQueryStatusParams result = new UrlLoaderQueryStatusParams();

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
    return "UrlLoaderQueryStatusParams("")";
  }
}

class UrlLoaderQueryStatusResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  UrlLoaderStatus status = null;

  UrlLoaderQueryStatusResponseParams() : super(kStructSize);

  static UrlLoaderQueryStatusResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static UrlLoaderQueryStatusResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    UrlLoaderQueryStatusResponseParams result = new UrlLoaderQueryStatusResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.status = UrlLoaderStatus.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(status, 8, false);
  }

  String toString() {
    return "UrlLoaderQueryStatusResponseParams("
           "status: $status" ")";
  }
}
const int kUrlLoader_start_name = 0;
const int kUrlLoader_followRedirect_name = 1;
const int kUrlLoader_queryStatus_name = 2;

const String UrlLoaderName =
      'mojo::UrlLoader';

abstract class UrlLoader {
  Future<UrlLoaderStartResponseParams> start(UrlRequest request,[Function responseFactory = null]);
  Future<UrlLoaderFollowRedirectResponseParams> followRedirect([Function responseFactory = null]);
  Future<UrlLoaderQueryStatusResponseParams> queryStatus([Function responseFactory = null]);

}


class UrlLoaderProxyImpl extends bindings.Proxy {
  UrlLoaderProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  UrlLoaderProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  UrlLoaderProxyImpl.unbound() : super.unbound();

  static UrlLoaderProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new UrlLoaderProxyImpl.fromEndpoint(endpoint);

  String get name => UrlLoaderName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kUrlLoader_start_name:
        var r = UrlLoaderStartResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          throw 'Message had unknown request Id: ${message.header.requestId}';
        }
        completerMap.remove(message.header.requestId);
        assert(!c.isCompleted);
        c.complete(r);
        break;
      case kUrlLoader_followRedirect_name:
        var r = UrlLoaderFollowRedirectResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          throw 'Message had unknown request Id: ${message.header.requestId}';
        }
        completerMap.remove(message.header.requestId);
        assert(!c.isCompleted);
        c.complete(r);
        break;
      case kUrlLoader_queryStatus_name:
        var r = UrlLoaderQueryStatusResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          throw 'Message had unknown request Id: ${message.header.requestId}';
        }
        completerMap.remove(message.header.requestId);
        assert(!c.isCompleted);
        c.complete(r);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }

  String toString() {
    var superString = super.toString();
    return "UrlLoaderProxyImpl($superString)";
  }
}


class _UrlLoaderProxyCalls implements UrlLoader {
  UrlLoaderProxyImpl _proxyImpl;

  _UrlLoaderProxyCalls(this._proxyImpl);
    Future<UrlLoaderStartResponseParams> start(UrlRequest request,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new UrlLoaderStartParams();
      params.request = request;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kUrlLoader_start_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    Future<UrlLoaderFollowRedirectResponseParams> followRedirect([Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new UrlLoaderFollowRedirectParams();
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kUrlLoader_followRedirect_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    Future<UrlLoaderQueryStatusResponseParams> queryStatus([Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new UrlLoaderQueryStatusParams();
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kUrlLoader_queryStatus_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
}


class UrlLoaderProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  UrlLoader ptr;
  final String name = UrlLoaderName;

  UrlLoaderProxy(UrlLoaderProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _UrlLoaderProxyCalls(proxyImpl);

  UrlLoaderProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new UrlLoaderProxyImpl.fromEndpoint(endpoint) {
    ptr = new _UrlLoaderProxyCalls(impl);
  }

  UrlLoaderProxy.fromHandle(core.MojoHandle handle) :
      impl = new UrlLoaderProxyImpl.fromHandle(handle) {
    ptr = new _UrlLoaderProxyCalls(impl);
  }

  UrlLoaderProxy.unbound() :
      impl = new UrlLoaderProxyImpl.unbound() {
    ptr = new _UrlLoaderProxyCalls(impl);
  }

  static UrlLoaderProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new UrlLoaderProxy.fromEndpoint(endpoint);

  Future close({bool nodefer: false}) => impl.close(nodefer: nodefer);

  String toString() {
    return "UrlLoaderProxy($impl)";
  }
}


class UrlLoaderStub extends bindings.Stub {
  UrlLoader _impl = null;

  UrlLoaderStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  UrlLoaderStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  UrlLoaderStub.unbound() : super.unbound();

  static UrlLoaderStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new UrlLoaderStub.fromEndpoint(endpoint);

  static const String name = UrlLoaderName;


  UrlLoaderStartResponseParams _UrlLoaderStartResponseParamsFactory(UrlResponse response) {
    var result = new UrlLoaderStartResponseParams();
    result.response = response;
    return result;
  }
  UrlLoaderFollowRedirectResponseParams _UrlLoaderFollowRedirectResponseParamsFactory(UrlResponse response) {
    var result = new UrlLoaderFollowRedirectResponseParams();
    result.response = response;
    return result;
  }
  UrlLoaderQueryStatusResponseParams _UrlLoaderQueryStatusResponseParamsFactory(UrlLoaderStatus status) {
    var result = new UrlLoaderQueryStatusResponseParams();
    result.status = status;
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_impl != null);
    switch (message.header.type) {
      case kUrlLoader_start_name:
        var params = UrlLoaderStartParams.deserialize(
            message.payload);
        return _impl.start(params.request,_UrlLoaderStartResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kUrlLoader_start_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kUrlLoader_followRedirect_name:
        var params = UrlLoaderFollowRedirectParams.deserialize(
            message.payload);
        return _impl.followRedirect(_UrlLoaderFollowRedirectResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kUrlLoader_followRedirect_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kUrlLoader_queryStatus_name:
        var params = UrlLoaderQueryStatusParams.deserialize(
            message.payload);
        return _impl.queryStatus(_UrlLoaderQueryStatusResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kUrlLoader_queryStatus_name,
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

  UrlLoader get impl => _impl;
      set impl(UrlLoader d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "UrlLoaderStub($superString)";
  }
}


PK     @[tF���jh  jh  =   mojo/services/network/public/interfaces/web_socket.mojom.dart// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library web_socket.mojom;

import 'dart:async';
import 'dart:mojo.bindings' as bindings;
import 'dart:mojo.core' as core;
import 'package:mojo/services/network/public/interfaces/network_error.mojom.dart' as network_error_mojom;


class WebSocketConnectParams extends bindings.Struct {
  static const int kStructSize = 40;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  String url = null;
  List<String> protocols = null;
  String origin = null;
  core.MojoDataPipeConsumer sendStream = null;
  Object client = null;

  WebSocketConnectParams() : super(kStructSize);

  static WebSocketConnectParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static WebSocketConnectParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    WebSocketConnectParams result = new WebSocketConnectParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.url = decoder0.decodeString(8, false);
    }
    {
      
      var decoder1 = decoder0.decodePointer(16, false);
      {
        var si1 = decoder1.decodeDataHeaderForPointerArray(bindings.kUnspecifiedArrayLength);
        result.protocols = new List<String>(si1.numElements);
        for (int i1 = 0; i1 < si1.numElements; ++i1) {
          
          result.protocols[i1] = decoder1.decodeString(bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i1, false);
        }
      }
    }
    {
      
      result.origin = decoder0.decodeString(24, false);
    }
    {
      
      result.sendStream = decoder0.decodeConsumerHandle(32, false);
    }
    {
      
      result.client = decoder0.decodeServiceInterface(36, false, WebSocketClientProxy.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeString(url, 8, false);
    
    if (protocols == null) {
      encoder0.encodeNullPointer(16, false);
    } else {
      var encoder1 = encoder0.encodePointerArray(protocols.length, 16, bindings.kUnspecifiedArrayLength);
      for (int i0 = 0; i0 < protocols.length; ++i0) {
        
        encoder1.encodeString(protocols[i0], bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i0, false);
      }
    }
    
    encoder0.encodeString(origin, 24, false);
    
    encoder0.encodeConsumerHandle(sendStream, 32, false);
    
    encoder0.encodeInterface(client, 36, false);
  }

  String toString() {
    return "WebSocketConnectParams("
           "url: $url" ", "
           "protocols: $protocols" ", "
           "origin: $origin" ", "
           "sendStream: $sendStream" ", "
           "client: $client" ")";
  }
}

class WebSocketSendParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  bool fin = false;
  int type = 0;
  int numBytes = 0;

  WebSocketSendParams() : super(kStructSize);

  static WebSocketSendParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static WebSocketSendParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    WebSocketSendParams result = new WebSocketSendParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.fin = decoder0.decodeBool(8, 0);
    }
    {
      
      result.type = decoder0.decodeInt32(12);
    }
    {
      
      result.numBytes = decoder0.decodeUint32(16);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeBool(fin, 8, 0);
    
    encoder0.encodeInt32(type, 12);
    
    encoder0.encodeUint32(numBytes, 16);
  }

  String toString() {
    return "WebSocketSendParams("
           "fin: $fin" ", "
           "type: $type" ", "
           "numBytes: $numBytes" ")";
  }
}

class WebSocketFlowControlParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  int quota = 0;

  WebSocketFlowControlParams() : super(kStructSize);

  static WebSocketFlowControlParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static WebSocketFlowControlParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    WebSocketFlowControlParams result = new WebSocketFlowControlParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.quota = decoder0.decodeInt64(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInt64(quota, 8);
  }

  String toString() {
    return "WebSocketFlowControlParams("
           "quota: $quota" ")";
  }
}

class WebSocketCloseParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  int code = 0;
  String reason = null;

  WebSocketCloseParams() : super(kStructSize);

  static WebSocketCloseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static WebSocketCloseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    WebSocketCloseParams result = new WebSocketCloseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.code = decoder0.decodeUint16(8);
    }
    {
      
      result.reason = decoder0.decodeString(16, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint16(code, 8);
    
    encoder0.encodeString(reason, 16, false);
  }

  String toString() {
    return "WebSocketCloseParams("
           "code: $code" ", "
           "reason: $reason" ")";
  }
}

class WebSocketClientDidConnectParams extends bindings.Struct {
  static const int kStructSize = 32;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  String selectedSubprotocol = null;
  String extensions = null;
  core.MojoDataPipeConsumer receiveStream = null;

  WebSocketClientDidConnectParams() : super(kStructSize);

  static WebSocketClientDidConnectParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static WebSocketClientDidConnectParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    WebSocketClientDidConnectParams result = new WebSocketClientDidConnectParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.selectedSubprotocol = decoder0.decodeString(8, false);
    }
    {
      
      result.extensions = decoder0.decodeString(16, false);
    }
    {
      
      result.receiveStream = decoder0.decodeConsumerHandle(24, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeString(selectedSubprotocol, 8, false);
    
    encoder0.encodeString(extensions, 16, false);
    
    encoder0.encodeConsumerHandle(receiveStream, 24, false);
  }

  String toString() {
    return "WebSocketClientDidConnectParams("
           "selectedSubprotocol: $selectedSubprotocol" ", "
           "extensions: $extensions" ", "
           "receiveStream: $receiveStream" ")";
  }
}

class WebSocketClientDidReceiveDataParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  bool fin = false;
  int type = 0;
  int numBytes = 0;

  WebSocketClientDidReceiveDataParams() : super(kStructSize);

  static WebSocketClientDidReceiveDataParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static WebSocketClientDidReceiveDataParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    WebSocketClientDidReceiveDataParams result = new WebSocketClientDidReceiveDataParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.fin = decoder0.decodeBool(8, 0);
    }
    {
      
      result.type = decoder0.decodeInt32(12);
    }
    {
      
      result.numBytes = decoder0.decodeUint32(16);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeBool(fin, 8, 0);
    
    encoder0.encodeInt32(type, 12);
    
    encoder0.encodeUint32(numBytes, 16);
  }

  String toString() {
    return "WebSocketClientDidReceiveDataParams("
           "fin: $fin" ", "
           "type: $type" ", "
           "numBytes: $numBytes" ")";
  }
}

class WebSocketClientDidReceiveFlowControlParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  int quota = 0;

  WebSocketClientDidReceiveFlowControlParams() : super(kStructSize);

  static WebSocketClientDidReceiveFlowControlParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static WebSocketClientDidReceiveFlowControlParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    WebSocketClientDidReceiveFlowControlParams result = new WebSocketClientDidReceiveFlowControlParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.quota = decoder0.decodeInt64(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInt64(quota, 8);
  }

  String toString() {
    return "WebSocketClientDidReceiveFlowControlParams("
           "quota: $quota" ")";
  }
}

class WebSocketClientDidFailParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  String message = null;

  WebSocketClientDidFailParams() : super(kStructSize);

  static WebSocketClientDidFailParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static WebSocketClientDidFailParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    WebSocketClientDidFailParams result = new WebSocketClientDidFailParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.message = decoder0.decodeString(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeString(message, 8, false);
  }

  String toString() {
    return "WebSocketClientDidFailParams("
           "message: $message" ")";
  }
}

class WebSocketClientDidCloseParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  bool wasClean = false;
  int code = 0;
  String reason = null;

  WebSocketClientDidCloseParams() : super(kStructSize);

  static WebSocketClientDidCloseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static WebSocketClientDidCloseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    WebSocketClientDidCloseParams result = new WebSocketClientDidCloseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.wasClean = decoder0.decodeBool(8, 0);
    }
    {
      
      result.code = decoder0.decodeUint16(10);
    }
    {
      
      result.reason = decoder0.decodeString(16, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeBool(wasClean, 8, 0);
    
    encoder0.encodeUint16(code, 10);
    
    encoder0.encodeString(reason, 16, false);
  }

  String toString() {
    return "WebSocketClientDidCloseParams("
           "wasClean: $wasClean" ", "
           "code: $code" ", "
           "reason: $reason" ")";
  }
}
const int kWebSocket_connect_name = 0;
const int kWebSocket_send_name = 1;
const int kWebSocket_flowControl_name = 2;
const int kWebSocket_close_name = 3;

const String WebSocketName =
      'mojo::WebSocket';

abstract class WebSocket {
  void connect(String url, List<String> protocols, String origin, core.MojoDataPipeConsumer sendStream, Object client);
  void send(bool fin, int type, int numBytes);
  void flowControl(int quota);
  void close(int code, String reason);

  static final ABNORMAL_CLOSE_CODE = 1006;
  
  static final int MessageType_CONTINUATION = 0;
  static final int MessageType_TEXT = MessageType_CONTINUATION + 1;
  static final int MessageType_BINARY = MessageType_TEXT + 1;
}


class WebSocketProxyImpl extends bindings.Proxy {
  WebSocketProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  WebSocketProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  WebSocketProxyImpl.unbound() : super.unbound();

  static WebSocketProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new WebSocketProxyImpl.fromEndpoint(endpoint);

  String get name => WebSocketName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }

  String toString() {
    var superString = super.toString();
    return "WebSocketProxyImpl($superString)";
  }
}


class _WebSocketProxyCalls implements WebSocket {
  WebSocketProxyImpl _proxyImpl;

  _WebSocketProxyCalls(this._proxyImpl);
    void connect(String url, List<String> protocols, String origin, core.MojoDataPipeConsumer sendStream, Object client) {
      assert(_proxyImpl.isBound);
      var params = new WebSocketConnectParams();
      params.url = url;
      params.protocols = protocols;
      params.origin = origin;
      params.sendStream = sendStream;
      params.client = client;
      _proxyImpl.sendMessage(params, kWebSocket_connect_name);
    }
  
    void send(bool fin, int type, int numBytes) {
      assert(_proxyImpl.isBound);
      var params = new WebSocketSendParams();
      params.fin = fin;
      params.type = type;
      params.numBytes = numBytes;
      _proxyImpl.sendMessage(params, kWebSocket_send_name);
    }
  
    void flowControl(int quota) {
      assert(_proxyImpl.isBound);
      var params = new WebSocketFlowControlParams();
      params.quota = quota;
      _proxyImpl.sendMessage(params, kWebSocket_flowControl_name);
    }
  
    void close(int code, String reason) {
      assert(_proxyImpl.isBound);
      var params = new WebSocketCloseParams();
      params.code = code;
      params.reason = reason;
      _proxyImpl.sendMessage(params, kWebSocket_close_name);
    }
  
}


class WebSocketProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  WebSocket ptr;
  final String name = WebSocketName;

  WebSocketProxy(WebSocketProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _WebSocketProxyCalls(proxyImpl);

  WebSocketProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new WebSocketProxyImpl.fromEndpoint(endpoint) {
    ptr = new _WebSocketProxyCalls(impl);
  }

  WebSocketProxy.fromHandle(core.MojoHandle handle) :
      impl = new WebSocketProxyImpl.fromHandle(handle) {
    ptr = new _WebSocketProxyCalls(impl);
  }

  WebSocketProxy.unbound() :
      impl = new WebSocketProxyImpl.unbound() {
    ptr = new _WebSocketProxyCalls(impl);
  }

  static WebSocketProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new WebSocketProxy.fromEndpoint(endpoint);

  Future close({bool nodefer: false}) => impl.close(nodefer: nodefer);

  String toString() {
    return "WebSocketProxy($impl)";
  }
}


class WebSocketStub extends bindings.Stub {
  WebSocket _impl = null;

  WebSocketStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  WebSocketStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  WebSocketStub.unbound() : super.unbound();

  static WebSocketStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new WebSocketStub.fromEndpoint(endpoint);

  static const String name = WebSocketName;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_impl != null);
    switch (message.header.type) {
      case kWebSocket_connect_name:
        var params = WebSocketConnectParams.deserialize(
            message.payload);
        _impl.connect(params.url, params.protocols, params.origin, params.sendStream, params.client);
        break;
      case kWebSocket_send_name:
        var params = WebSocketSendParams.deserialize(
            message.payload);
        _impl.send(params.fin, params.type, params.numBytes);
        break;
      case kWebSocket_flowControl_name:
        var params = WebSocketFlowControlParams.deserialize(
            message.payload);
        _impl.flowControl(params.quota);
        break;
      case kWebSocket_close_name:
        var params = WebSocketCloseParams.deserialize(
            message.payload);
        _impl.close(params.code, params.reason);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  WebSocket get impl => _impl;
      set impl(WebSocket d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "WebSocketStub($superString)";
  }
}

const int kWebSocketClient_didConnect_name = 0;
const int kWebSocketClient_didReceiveData_name = 1;
const int kWebSocketClient_didReceiveFlowControl_name = 2;
const int kWebSocketClient_didFail_name = 3;
const int kWebSocketClient_didClose_name = 4;

const String WebSocketClientName =
      'mojo::WebSocketClient';

abstract class WebSocketClient {
  void didConnect(String selectedSubprotocol, String extensions, core.MojoDataPipeConsumer receiveStream);
  void didReceiveData(bool fin, int type, int numBytes);
  void didReceiveFlowControl(int quota);
  void didFail(String message);
  void didClose(bool wasClean, int code, String reason);

}


class WebSocketClientProxyImpl extends bindings.Proxy {
  WebSocketClientProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  WebSocketClientProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  WebSocketClientProxyImpl.unbound() : super.unbound();

  static WebSocketClientProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new WebSocketClientProxyImpl.fromEndpoint(endpoint);

  String get name => WebSocketClientName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }

  String toString() {
    var superString = super.toString();
    return "WebSocketClientProxyImpl($superString)";
  }
}


class _WebSocketClientProxyCalls implements WebSocketClient {
  WebSocketClientProxyImpl _proxyImpl;

  _WebSocketClientProxyCalls(this._proxyImpl);
    void didConnect(String selectedSubprotocol, String extensions, core.MojoDataPipeConsumer receiveStream) {
      assert(_proxyImpl.isBound);
      var params = new WebSocketClientDidConnectParams();
      params.selectedSubprotocol = selectedSubprotocol;
      params.extensions = extensions;
      params.receiveStream = receiveStream;
      _proxyImpl.sendMessage(params, kWebSocketClient_didConnect_name);
    }
  
    void didReceiveData(bool fin, int type, int numBytes) {
      assert(_proxyImpl.isBound);
      var params = new WebSocketClientDidReceiveDataParams();
      params.fin = fin;
      params.type = type;
      params.numBytes = numBytes;
      _proxyImpl.sendMessage(params, kWebSocketClient_didReceiveData_name);
    }
  
    void didReceiveFlowControl(int quota) {
      assert(_proxyImpl.isBound);
      var params = new WebSocketClientDidReceiveFlowControlParams();
      params.quota = quota;
      _proxyImpl.sendMessage(params, kWebSocketClient_didReceiveFlowControl_name);
    }
  
    void didFail(String message) {
      assert(_proxyImpl.isBound);
      var params = new WebSocketClientDidFailParams();
      params.message = message;
      _proxyImpl.sendMessage(params, kWebSocketClient_didFail_name);
    }
  
    void didClose(bool wasClean, int code, String reason) {
      assert(_proxyImpl.isBound);
      var params = new WebSocketClientDidCloseParams();
      params.wasClean = wasClean;
      params.code = code;
      params.reason = reason;
      _proxyImpl.sendMessage(params, kWebSocketClient_didClose_name);
    }
  
}


class WebSocketClientProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  WebSocketClient ptr;
  final String name = WebSocketClientName;

  WebSocketClientProxy(WebSocketClientProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _WebSocketClientProxyCalls(proxyImpl);

  WebSocketClientProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new WebSocketClientProxyImpl.fromEndpoint(endpoint) {
    ptr = new _WebSocketClientProxyCalls(impl);
  }

  WebSocketClientProxy.fromHandle(core.MojoHandle handle) :
      impl = new WebSocketClientProxyImpl.fromHandle(handle) {
    ptr = new _WebSocketClientProxyCalls(impl);
  }

  WebSocketClientProxy.unbound() :
      impl = new WebSocketClientProxyImpl.unbound() {
    ptr = new _WebSocketClientProxyCalls(impl);
  }

  static WebSocketClientProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new WebSocketClientProxy.fromEndpoint(endpoint);

  Future close({bool nodefer: false}) => impl.close(nodefer: nodefer);

  String toString() {
    return "WebSocketClientProxy($impl)";
  }
}


class WebSocketClientStub extends bindings.Stub {
  WebSocketClient _impl = null;

  WebSocketClientStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  WebSocketClientStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  WebSocketClientStub.unbound() : super.unbound();

  static WebSocketClientStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new WebSocketClientStub.fromEndpoint(endpoint);

  static const String name = WebSocketClientName;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_impl != null);
    switch (message.header.type) {
      case kWebSocketClient_didConnect_name:
        var params = WebSocketClientDidConnectParams.deserialize(
            message.payload);
        _impl.didConnect(params.selectedSubprotocol, params.extensions, params.receiveStream);
        break;
      case kWebSocketClient_didReceiveData_name:
        var params = WebSocketClientDidReceiveDataParams.deserialize(
            message.payload);
        _impl.didReceiveData(params.fin, params.type, params.numBytes);
        break;
      case kWebSocketClient_didReceiveFlowControl_name:
        var params = WebSocketClientDidReceiveFlowControlParams.deserialize(
            message.payload);
        _impl.didReceiveFlowControl(params.quota);
        break;
      case kWebSocketClient_didFail_name:
        var params = WebSocketClientDidFailParams.deserialize(
            message.payload);
        _impl.didFail(params.message);
        break;
      case kWebSocketClient_didClose_name:
        var params = WebSocketClientDidCloseParams.deserialize(
            message.payload);
        _impl.didClose(params.wasClean, params.code, params.reason);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  WebSocketClient get impl => _impl;
      set impl(WebSocketClient d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "WebSocketClientStub($superString)";
  }
}


PK     TlF����P  P  	           ��    main.dartPK     @[tF'@x+  +  9           �w  mojo/public/interfaces/application/application.mojom.dartPK     @[tFj��  �  >           ��3  mojo/public/interfaces/application/service_provider.mojom.dartPK     @[tFI��    3           �'K  mojo/public/interfaces/application/shell.mojom.dartPK     @[tFcWHaj.  j.  ?           ��b  mojo/services/network/public/interfaces/cookie_store.mojom.dartPK     @[tF�4QYS  S  >           �W�  mojo/services/network/public/interfaces/net_address.mojom.dartPK     @[tFR��;+  +  @           ��  mojo/services/network/public/interfaces/network_error.mojom.dartPK     @[tFGհ��_  �_  B           ���  mojo/services/network/public/interfaces/network_service.mojom.dartPK     @[tF�|	�9  9  C           ��
 mojo/services/network/public/interfaces/tcp_bound_socket.mojom.dartPK     @[tFq���  �  G           �LD mojo/services/network/public/interfaces/tcp_connected_socket.mojom.dartPK     @[tFj���%  �%  D           �NS mojo/services/network/public/interfaces/tcp_server_socket.mojom.dartPK     @[tF��,uʯ  ʯ  =           ��y mojo/services/network/public/interfaces/udp_socket.mojom.dartPK     @[tF�%���_  �_  =           ��) mojo/services/network/public/interfaces/url_loader.mojom.dartPK     @[tF���jh  jh  =           ��� mojo/services/network/public/interfaces/web_socket.mojom.dartPK      �  q�   