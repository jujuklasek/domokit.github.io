#!mojo mojo:dart_content_handler
PK     �zYF��O)H  H  	   main.dart// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Run with, e.g.:
// mojo_shell "mojo:dart_wget http://www.google.com"

import 'dart:async';
import 'dart:typed_data';
import 'mojo:application';
import 'mojo:bindings';
import 'mojo:core';

import 'package:mojo/services/network/public/interfaces/network_service.mojom.dart';
import 'package:mojo/services/network/public/interfaces/url_loader.mojom.dart';

class WGet extends Application {
  NetworkServiceProxy _networkService;
  UrlLoaderProxy _urlLoaderProxy;

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
    close();
  }

  Future<ByteData> _getUrl(String url) async {
    _initProxiesIfNeeded();

    var urlRequest = new UrlRequest()
        ..url = url
        ..autoFollowRedirects = true;

    var urlResponse = await _urlLoaderProxy.start(urlRequest);
    print(">>> Headers <<<");
    print(urlResponse.response.headers.join('\n'));

    return DataPipeDrainer.drainHandle(urlResponse.response.body);
  }

  void _initProxiesIfNeeded() {
    if (_networkService == null) {
      _networkService = new NetworkServiceProxy.unbound();
      connectToService("mojo:network_service", _networkService);
    }
    if (_urlLoaderProxy == null) {
      _urlLoaderProxy = new UrlLoaderProxy.unbound();
      _networkService.createUrlLoader(_urlLoaderProxy);
    }
  }

  void _closeProxies() {
    _urlLoaderProxy.close();
    _networkService.close();
    _urlLoaderProxy = null;
    _networkService = null;
  }
}

main(List args) {
  MojoHandle appHandle = new MojoHandle(args[0]);
  var wget = new WGet.fromHandle(appHandle);
  wget.listen();
}
PK     cZF��]$  $  9   mojo/public/interfaces/application/application.mojom.dart// Copyright 2014 The Chromium Authors. All rights reserved.
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

  StreamSubscription<int> listen({Function onClosed}) =>
      stub.listen(onClosed: onClosed);

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


PK     cZFH���Z  Z  >   mojo/public/interfaces/application/service_provider.mojom.dart// Copyright 2014 The Chromium Authors. All rights reserved.
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

  StreamSubscription<int> listen({Function onClosed}) =>
      stub.listen(onClosed: onClosed);

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


PK     cZFDB";�  �  3   mojo/public/interfaces/application/shell.mojom.dart// Copyright 2014 The Chromium Authors. All rights reserved.
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

  StreamSubscription<int> listen({Function onClosed}) =>
      stub.listen(onClosed: onClosed);

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


PK     cZF�����'  �'  ?   mojo/services/network/public/interfaces/cookie_store.mojom.dart// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library cookie_store.mojom;

import 'dart:async';
import 'mojo:bindings' as bindings;
import 'mojo:core' as core;


class CookieStoreGetParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
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

class CookieStoreGetResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
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
        (mainDataHeader.version < 1)) {
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
}

class CookieStoreSetParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
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
        (mainDataHeader.version < 2)) {
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
}

class CookieStoreSetResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
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
        (mainDataHeader.version < 1)) {
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
}
const int kCookieStore_get_name = 0;
const int kCookieStore_set_name = 1;

abstract class CookieStore implements core.Listener {
  static const String name = 'mojo::CookieStore';
  CookieStoreStub stub;

  CookieStore(core.MojoMessagePipeEndpoint endpoint) :
      stub = new CookieStoreStub(endpoint);

  CookieStore.fromHandle(core.MojoHandle handle) :
      stub = new CookieStoreStub.fromHandle(handle);

  CookieStore.fromStub(this.stub);

  CookieStore.unbound() :
      stub = new CookieStoreStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen({Function onClosed}) =>
      stub.listen(onClosed: onClosed);

  CookieStore get delegate => stub.delegate;
  set delegate(CookieStore d) {
    stub.delegate = d;
  }
  Future<CookieStoreGetResponseParams> get(String url,[Function responseFactory = null]);
  Future<CookieStoreSetResponseParams> set(String url,String cookie,[Function responseFactory = null]);

}

class CookieStoreProxy extends bindings.Proxy implements CookieStore {
  CookieStoreProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  CookieStoreProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  CookieStoreProxy.unbound() : super.unbound();

  String get name => CookieStore.name;

  static CookieStoreProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new CookieStoreProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kCookieStore_get_name:
        var r = CookieStoreGetResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      case kCookieStore_set_name:
        var r = CookieStoreSetResponseParams.deserialize(
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
  Future<CookieStoreGetResponseParams> get(String url,[Function responseFactory = null]) {
    var params = new CookieStoreGetParams();
    params.url = url;
    return sendMessageWithRequestId(
        params,
        kCookieStore_get_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  Future<CookieStoreSetResponseParams> set(String url,String cookie,[Function responseFactory = null]) {
    var params = new CookieStoreSetParams();
    params.url = url;
    params.cookie = cookie;
    return sendMessageWithRequestId(
        params,
        kCookieStore_set_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
}

class CookieStoreStub extends bindings.Stub {
  CookieStore _delegate = null;

  CookieStoreStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  CookieStoreStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  CookieStoreStub.unbound() : super.unbound();

  static CookieStoreStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new CookieStoreStub(endpoint);

  static const String name = CookieStore.name;


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
    assert(_delegate != null);
    switch (message.header.type) {
      case kCookieStore_get_name:
        var params = CookieStoreGetParams.deserialize(
            message.payload);
        return _delegate.get(params.url,_CookieStoreGetResponseParamsFactory).then((response) {
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
        return _delegate.set(params.url,params.cookie,_CookieStoreSetResponseParamsFactory).then((response) {
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

  CookieStore get delegate => _delegate;
      set delegate(CookieStore d) {
    assert(_delegate == null);
    _delegate = d;
  }
}


PK     cZFQ��P�  �  >   mojo/services/network/public/interfaces/net_address.mojom.dart// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library net_address.mojom;

import 'dart:async';
import 'mojo:bindings' as bindings;
import 'mojo:core' as core;

final int NetAddressFamily_UNSPECIFIED = 0;
final int NetAddressFamily_IPV4 = NetAddressFamily_UNSPECIFIED + 1;
final int NetAddressFamily_IPV6 = NetAddressFamily_IPV4 + 1;


class NetAddressIPv4 extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
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
        (mainDataHeader.version < 2)) {
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
}

class NetAddressIPv6 extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
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
        (mainDataHeader.version < 2)) {
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
}

class NetAddress extends bindings.Struct {
  static const int kStructSize = 32;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 3);
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
        (mainDataHeader.version < 3)) {
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
}

PK     cZF�ݫ��  �  @   mojo/services/network/public/interfaces/network_error.mojom.dart// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library network_error.mojom;

import 'dart:async';
import 'mojo:bindings' as bindings;
import 'mojo:core' as core;


class NetworkError extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
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
        (mainDataHeader.version < 2)) {
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
}

PK     cZF_��U  U  B   mojo/services/network/public/interfaces/network_service.mojom.dart// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library network_service.mojom;

import 'dart:async';
import 'mojo:bindings' as bindings;
import 'mojo:core' as core;
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
      const bindings.StructDataHeader(kStructSize, 1);
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
        (mainDataHeader.version < 1)) {
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
}

class NetworkServiceGetCookieStoreParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
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
        (mainDataHeader.version < 1)) {
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
}

class NetworkServiceCreateWebSocketParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
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
        (mainDataHeader.version < 1)) {
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
}

class NetworkServiceCreateTcpBoundSocketParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
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
        (mainDataHeader.version < 2)) {
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
}

class NetworkServiceCreateTcpBoundSocketResponseParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
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
        (mainDataHeader.version < 2)) {
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
}

class NetworkServiceCreateTcpConnectedSocketParams extends bindings.Struct {
  static const int kStructSize = 32;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 4);
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
        (mainDataHeader.version < 4)) {
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
}

class NetworkServiceCreateTcpConnectedSocketResponseParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
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
        (mainDataHeader.version < 2)) {
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
}

class NetworkServiceCreateUdpSocketParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
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
        (mainDataHeader.version < 1)) {
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
}
const int kNetworkService_createUrlLoader_name = 0;
const int kNetworkService_getCookieStore_name = 1;
const int kNetworkService_createWebSocket_name = 2;
const int kNetworkService_createTcpBoundSocket_name = 3;
const int kNetworkService_createTcpConnectedSocket_name = 4;
const int kNetworkService_createUdpSocket_name = 5;

abstract class NetworkService implements core.Listener {
  static const String name = 'mojo::NetworkService';
  NetworkServiceStub stub;

  NetworkService(core.MojoMessagePipeEndpoint endpoint) :
      stub = new NetworkServiceStub(endpoint);

  NetworkService.fromHandle(core.MojoHandle handle) :
      stub = new NetworkServiceStub.fromHandle(handle);

  NetworkService.fromStub(this.stub);

  NetworkService.unbound() :
      stub = new NetworkServiceStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen({Function onClosed}) =>
      stub.listen(onClosed: onClosed);

  NetworkService get delegate => stub.delegate;
  set delegate(NetworkService d) {
    stub.delegate = d;
  }
  void createUrlLoader(Object loader);
  void getCookieStore(Object cookieStore);
  void createWebSocket(Object socket);
  Future<NetworkServiceCreateTcpBoundSocketResponseParams> createTcpBoundSocket(net_address_mojom.NetAddress localAddress,Object boundSocket,[Function responseFactory = null]);
  Future<NetworkServiceCreateTcpConnectedSocketResponseParams> createTcpConnectedSocket(net_address_mojom.NetAddress remoteAddress,core.MojoDataPipeConsumer sendStream,core.MojoDataPipeProducer receiveStream,Object clientSocket,[Function responseFactory = null]);
  void createUdpSocket(Object socket);

}

class NetworkServiceProxy extends bindings.Proxy implements NetworkService {
  NetworkServiceProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  NetworkServiceProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  NetworkServiceProxy.unbound() : super.unbound();

  String get name => NetworkService.name;

  static NetworkServiceProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new NetworkServiceProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kNetworkService_createTcpBoundSocket_name:
        var r = NetworkServiceCreateTcpBoundSocketResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      case kNetworkService_createTcpConnectedSocket_name:
        var r = NetworkServiceCreateTcpConnectedSocketResponseParams.deserialize(
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
  void createUrlLoader(Object loader) {
    var params = new NetworkServiceCreateUrlLoaderParams();
    params.loader = loader;
    sendMessage(params, kNetworkService_createUrlLoader_name);
  }

  void getCookieStore(Object cookieStore) {
    var params = new NetworkServiceGetCookieStoreParams();
    params.cookieStore = cookieStore;
    sendMessage(params, kNetworkService_getCookieStore_name);
  }

  void createWebSocket(Object socket) {
    var params = new NetworkServiceCreateWebSocketParams();
    params.socket = socket;
    sendMessage(params, kNetworkService_createWebSocket_name);
  }

  Future<NetworkServiceCreateTcpBoundSocketResponseParams> createTcpBoundSocket(net_address_mojom.NetAddress localAddress,Object boundSocket,[Function responseFactory = null]) {
    var params = new NetworkServiceCreateTcpBoundSocketParams();
    params.localAddress = localAddress;
    params.boundSocket = boundSocket;
    return sendMessageWithRequestId(
        params,
        kNetworkService_createTcpBoundSocket_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  Future<NetworkServiceCreateTcpConnectedSocketResponseParams> createTcpConnectedSocket(net_address_mojom.NetAddress remoteAddress,core.MojoDataPipeConsumer sendStream,core.MojoDataPipeProducer receiveStream,Object clientSocket,[Function responseFactory = null]) {
    var params = new NetworkServiceCreateTcpConnectedSocketParams();
    params.remoteAddress = remoteAddress;
    params.sendStream = sendStream;
    params.receiveStream = receiveStream;
    params.clientSocket = clientSocket;
    return sendMessageWithRequestId(
        params,
        kNetworkService_createTcpConnectedSocket_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  void createUdpSocket(Object socket) {
    var params = new NetworkServiceCreateUdpSocketParams();
    params.socket = socket;
    sendMessage(params, kNetworkService_createUdpSocket_name);
  }

}

class NetworkServiceStub extends bindings.Stub {
  NetworkService _delegate = null;

  NetworkServiceStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  NetworkServiceStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  NetworkServiceStub.unbound() : super.unbound();

  static NetworkServiceStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new NetworkServiceStub(endpoint);

  static const String name = NetworkService.name;


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
    assert(_delegate != null);
    switch (message.header.type) {
      case kNetworkService_createUrlLoader_name:
        var params = NetworkServiceCreateUrlLoaderParams.deserialize(
            message.payload);
        _delegate.createUrlLoader(params.loader);
        break;
      case kNetworkService_getCookieStore_name:
        var params = NetworkServiceGetCookieStoreParams.deserialize(
            message.payload);
        _delegate.getCookieStore(params.cookieStore);
        break;
      case kNetworkService_createWebSocket_name:
        var params = NetworkServiceCreateWebSocketParams.deserialize(
            message.payload);
        _delegate.createWebSocket(params.socket);
        break;
      case kNetworkService_createTcpBoundSocket_name:
        var params = NetworkServiceCreateTcpBoundSocketParams.deserialize(
            message.payload);
        return _delegate.createTcpBoundSocket(params.localAddress,params.boundSocket,_NetworkServiceCreateTcpBoundSocketResponseParamsFactory).then((response) {
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
        return _delegate.createTcpConnectedSocket(params.remoteAddress,params.sendStream,params.receiveStream,params.clientSocket,_NetworkServiceCreateTcpConnectedSocketResponseParamsFactory).then((response) {
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
        _delegate.createUdpSocket(params.socket);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  NetworkService get delegate => _delegate;
      set delegate(NetworkService d) {
    assert(_delegate == null);
    _delegate = d;
  }
}


PK     cZFjWmx1  x1  C   mojo/services/network/public/interfaces/tcp_bound_socket.mojom.dart// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library tcp_bound_socket.mojom;

import 'dart:async';
import 'mojo:bindings' as bindings;
import 'mojo:core' as core;
import 'package:mojo/services/network/public/interfaces/net_address.mojom.dart' as net_address_mojom;
import 'package:mojo/services/network/public/interfaces/network_error.mojom.dart' as network_error_mojom;
import 'package:mojo/services/network/public/interfaces/tcp_connected_socket.mojom.dart' as tcp_connected_socket_mojom;
import 'package:mojo/services/network/public/interfaces/tcp_server_socket.mojom.dart' as tcp_server_socket_mojom;


class TcpBoundSocketStartListeningParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
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
        (mainDataHeader.version < 1)) {
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
}

class TcpBoundSocketStartListeningResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
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
        (mainDataHeader.version < 1)) {
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
}

class TcpBoundSocketConnectParams extends bindings.Struct {
  static const int kStructSize = 32;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 4);
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
        (mainDataHeader.version < 4)) {
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
}

class TcpBoundSocketConnectResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
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
        (mainDataHeader.version < 1)) {
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
}
const int kTcpBoundSocket_startListening_name = 0;
const int kTcpBoundSocket_connect_name = 1;

abstract class TcpBoundSocket implements core.Listener {
  static const String name = 'mojo::TcpBoundSocket';
  TcpBoundSocketStub stub;

  TcpBoundSocket(core.MojoMessagePipeEndpoint endpoint) :
      stub = new TcpBoundSocketStub(endpoint);

  TcpBoundSocket.fromHandle(core.MojoHandle handle) :
      stub = new TcpBoundSocketStub.fromHandle(handle);

  TcpBoundSocket.fromStub(this.stub);

  TcpBoundSocket.unbound() :
      stub = new TcpBoundSocketStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen({Function onClosed}) =>
      stub.listen(onClosed: onClosed);

  TcpBoundSocket get delegate => stub.delegate;
  set delegate(TcpBoundSocket d) {
    stub.delegate = d;
  }
  Future<TcpBoundSocketStartListeningResponseParams> startListening(Object server,[Function responseFactory = null]);
  Future<TcpBoundSocketConnectResponseParams> connect(net_address_mojom.NetAddress remoteAddress,core.MojoDataPipeConsumer sendStream,core.MojoDataPipeProducer receiveStream,Object clientSocket,[Function responseFactory = null]);

}

class TcpBoundSocketProxy extends bindings.Proxy implements TcpBoundSocket {
  TcpBoundSocketProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  TcpBoundSocketProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  TcpBoundSocketProxy.unbound() : super.unbound();

  String get name => TcpBoundSocket.name;

  static TcpBoundSocketProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TcpBoundSocketProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kTcpBoundSocket_startListening_name:
        var r = TcpBoundSocketStartListeningResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      case kTcpBoundSocket_connect_name:
        var r = TcpBoundSocketConnectResponseParams.deserialize(
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
  Future<TcpBoundSocketStartListeningResponseParams> startListening(Object server,[Function responseFactory = null]) {
    var params = new TcpBoundSocketStartListeningParams();
    params.server = server;
    return sendMessageWithRequestId(
        params,
        kTcpBoundSocket_startListening_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  Future<TcpBoundSocketConnectResponseParams> connect(net_address_mojom.NetAddress remoteAddress,core.MojoDataPipeConsumer sendStream,core.MojoDataPipeProducer receiveStream,Object clientSocket,[Function responseFactory = null]) {
    var params = new TcpBoundSocketConnectParams();
    params.remoteAddress = remoteAddress;
    params.sendStream = sendStream;
    params.receiveStream = receiveStream;
    params.clientSocket = clientSocket;
    return sendMessageWithRequestId(
        params,
        kTcpBoundSocket_connect_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
}

class TcpBoundSocketStub extends bindings.Stub {
  TcpBoundSocket _delegate = null;

  TcpBoundSocketStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  TcpBoundSocketStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  TcpBoundSocketStub.unbound() : super.unbound();

  static TcpBoundSocketStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TcpBoundSocketStub(endpoint);

  static const String name = TcpBoundSocket.name;


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
    assert(_delegate != null);
    switch (message.header.type) {
      case kTcpBoundSocket_startListening_name:
        var params = TcpBoundSocketStartListeningParams.deserialize(
            message.payload);
        return _delegate.startListening(params.server,_TcpBoundSocketStartListeningResponseParamsFactory).then((response) {
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
        return _delegate.connect(params.remoteAddress,params.sendStream,params.receiveStream,params.clientSocket,_TcpBoundSocketConnectResponseParamsFactory).then((response) {
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

  TcpBoundSocket get delegate => _delegate;
      set delegate(TcpBoundSocket d) {
    assert(_delegate == null);
    _delegate = d;
  }
}


PK     cZFK���
  �
  G   mojo/services/network/public/interfaces/tcp_connected_socket.mojom.dart// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library tcp_connected_socket.mojom;

import 'dart:async';
import 'mojo:bindings' as bindings;
import 'mojo:core' as core;


abstract class TcpConnectedSocket implements core.Listener {
  static const String name = 'mojo::TcpConnectedSocket';
  TcpConnectedSocketStub stub;

  TcpConnectedSocket(core.MojoMessagePipeEndpoint endpoint) :
      stub = new TcpConnectedSocketStub(endpoint);

  TcpConnectedSocket.fromHandle(core.MojoHandle handle) :
      stub = new TcpConnectedSocketStub.fromHandle(handle);

  TcpConnectedSocket.fromStub(this.stub);

  TcpConnectedSocket.unbound() :
      stub = new TcpConnectedSocketStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen({Function onClosed}) =>
      stub.listen(onClosed: onClosed);

  TcpConnectedSocket get delegate => stub.delegate;
  set delegate(TcpConnectedSocket d) {
    stub.delegate = d;
  }

}

class TcpConnectedSocketProxy extends bindings.Proxy implements TcpConnectedSocket {
  TcpConnectedSocketProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  TcpConnectedSocketProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  TcpConnectedSocketProxy.unbound() : super.unbound();

  String get name => TcpConnectedSocket.name;

  static TcpConnectedSocketProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TcpConnectedSocketProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
}

class TcpConnectedSocketStub extends bindings.Stub {
  TcpConnectedSocket _delegate = null;

  TcpConnectedSocketStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  TcpConnectedSocketStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  TcpConnectedSocketStub.unbound() : super.unbound();

  static TcpConnectedSocketStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TcpConnectedSocketStub(endpoint);

  static const String name = TcpConnectedSocket.name;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  TcpConnectedSocket get delegate => _delegate;
      set delegate(TcpConnectedSocket d) {
    assert(_delegate == null);
    _delegate = d;
  }
}


PK     cZF�?"��  �  D   mojo/services/network/public/interfaces/tcp_server_socket.mojom.dart// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library tcp_server_socket.mojom;

import 'dart:async';
import 'mojo:bindings' as bindings;
import 'mojo:core' as core;
import 'package:mojo/services/network/public/interfaces/net_address.mojom.dart' as net_address_mojom;
import 'package:mojo/services/network/public/interfaces/network_error.mojom.dart' as network_error_mojom;
import 'package:mojo/services/network/public/interfaces/tcp_connected_socket.mojom.dart' as tcp_connected_socket_mojom;


class TcpServerSocketAcceptParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 3);
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
        (mainDataHeader.version < 3)) {
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
}

class TcpServerSocketAcceptResponseParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
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
        (mainDataHeader.version < 2)) {
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
}
const int kTcpServerSocket_accept_name = 0;

abstract class TcpServerSocket implements core.Listener {
  static const String name = 'mojo::TcpServerSocket';
  TcpServerSocketStub stub;

  TcpServerSocket(core.MojoMessagePipeEndpoint endpoint) :
      stub = new TcpServerSocketStub(endpoint);

  TcpServerSocket.fromHandle(core.MojoHandle handle) :
      stub = new TcpServerSocketStub.fromHandle(handle);

  TcpServerSocket.fromStub(this.stub);

  TcpServerSocket.unbound() :
      stub = new TcpServerSocketStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen({Function onClosed}) =>
      stub.listen(onClosed: onClosed);

  TcpServerSocket get delegate => stub.delegate;
  set delegate(TcpServerSocket d) {
    stub.delegate = d;
  }
  Future<TcpServerSocketAcceptResponseParams> accept(core.MojoDataPipeConsumer sendStream,core.MojoDataPipeProducer receiveStream,Object clientSocket,[Function responseFactory = null]);

}

class TcpServerSocketProxy extends bindings.Proxy implements TcpServerSocket {
  TcpServerSocketProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  TcpServerSocketProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  TcpServerSocketProxy.unbound() : super.unbound();

  String get name => TcpServerSocket.name;

  static TcpServerSocketProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TcpServerSocketProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kTcpServerSocket_accept_name:
        var r = TcpServerSocketAcceptResponseParams.deserialize(
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
  Future<TcpServerSocketAcceptResponseParams> accept(core.MojoDataPipeConsumer sendStream,core.MojoDataPipeProducer receiveStream,Object clientSocket,[Function responseFactory = null]) {
    var params = new TcpServerSocketAcceptParams();
    params.sendStream = sendStream;
    params.receiveStream = receiveStream;
    params.clientSocket = clientSocket;
    return sendMessageWithRequestId(
        params,
        kTcpServerSocket_accept_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
}

class TcpServerSocketStub extends bindings.Stub {
  TcpServerSocket _delegate = null;

  TcpServerSocketStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  TcpServerSocketStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  TcpServerSocketStub.unbound() : super.unbound();

  static TcpServerSocketStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TcpServerSocketStub(endpoint);

  static const String name = TcpServerSocket.name;


  TcpServerSocketAcceptResponseParams _TcpServerSocketAcceptResponseParamsFactory(network_error_mojom.NetworkError result, net_address_mojom.NetAddress remoteAddress) {
    var result = new TcpServerSocketAcceptResponseParams();
    result.result = result;
    result.remoteAddress = remoteAddress;
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kTcpServerSocket_accept_name:
        var params = TcpServerSocketAcceptParams.deserialize(
            message.payload);
        return _delegate.accept(params.sendStream,params.receiveStream,params.clientSocket,_TcpServerSocketAcceptResponseParamsFactory).then((response) {
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

  TcpServerSocket get delegate => _delegate;
      set delegate(TcpServerSocket d) {
    assert(_delegate == null);
    _delegate = d;
  }
}


PK     cZF���̚  ̚  =   mojo/services/network/public/interfaces/udp_socket.mojom.dart// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library udp_socket.mojom;

import 'dart:async';
import 'mojo:bindings' as bindings;
import 'mojo:core' as core;
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
}

class UdpSocketAllowAddressReuseResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
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
        (mainDataHeader.version < 1)) {
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
}

class UdpSocketBindParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
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
        (mainDataHeader.version < 1)) {
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
}

class UdpSocketBindResponseParams extends bindings.Struct {
  static const int kStructSize = 32;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 3);
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
        (mainDataHeader.version < 3)) {
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
}

class UdpSocketConnectParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
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
        (mainDataHeader.version < 1)) {
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
}

class UdpSocketConnectResponseParams extends bindings.Struct {
  static const int kStructSize = 32;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 3);
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
        (mainDataHeader.version < 3)) {
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
}

class UdpSocketSetSendBufferSizeParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
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
        (mainDataHeader.version < 1)) {
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
}

class UdpSocketSetSendBufferSizeResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
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
        (mainDataHeader.version < 1)) {
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
}

class UdpSocketSetReceiveBufferSizeParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
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
        (mainDataHeader.version < 1)) {
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
}

class UdpSocketSetReceiveBufferSizeResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
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
        (mainDataHeader.version < 1)) {
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
}

class UdpSocketNegotiateMaxPendingSendRequestsParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
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
        (mainDataHeader.version < 1)) {
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
}

class UdpSocketNegotiateMaxPendingSendRequestsResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
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
        (mainDataHeader.version < 1)) {
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
}

class UdpSocketReceiveMoreParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
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
        (mainDataHeader.version < 1)) {
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
}

class UdpSocketSendToParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
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
        (mainDataHeader.version < 2)) {
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
}

class UdpSocketSendToResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
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
        (mainDataHeader.version < 1)) {
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
}

class UdpSocketReceiverOnReceivedParams extends bindings.Struct {
  static const int kStructSize = 32;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 3);
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
        (mainDataHeader.version < 3)) {
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
}
const int kUdpSocket_allowAddressReuse_name = 0;
const int kUdpSocket_bind_name = 1;
const int kUdpSocket_connect_name = 2;
const int kUdpSocket_setSendBufferSize_name = 3;
const int kUdpSocket_setReceiveBufferSize_name = 4;
const int kUdpSocket_negotiateMaxPendingSendRequests_name = 5;
const int kUdpSocket_receiveMore_name = 6;
const int kUdpSocket_sendTo_name = 7;

abstract class UdpSocket implements core.Listener {
  static const String name = 'mojo::UdpSocket';
  UdpSocketStub stub;

  UdpSocket(core.MojoMessagePipeEndpoint endpoint) :
      stub = new UdpSocketStub(endpoint);

  UdpSocket.fromHandle(core.MojoHandle handle) :
      stub = new UdpSocketStub.fromHandle(handle);

  UdpSocket.fromStub(this.stub);

  UdpSocket.unbound() :
      stub = new UdpSocketStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen({Function onClosed}) =>
      stub.listen(onClosed: onClosed);

  UdpSocket get delegate => stub.delegate;
  set delegate(UdpSocket d) {
    stub.delegate = d;
  }
  Future<UdpSocketAllowAddressReuseResponseParams> allowAddressReuse([Function responseFactory = null]);
  Future<UdpSocketBindResponseParams> bind(net_address_mojom.NetAddress addr,[Function responseFactory = null]);
  Future<UdpSocketConnectResponseParams> connect(net_address_mojom.NetAddress remoteAddr,[Function responseFactory = null]);
  Future<UdpSocketSetSendBufferSizeResponseParams> setSendBufferSize(int size,[Function responseFactory = null]);
  Future<UdpSocketSetReceiveBufferSizeResponseParams> setReceiveBufferSize(int size,[Function responseFactory = null]);
  Future<UdpSocketNegotiateMaxPendingSendRequestsResponseParams> negotiateMaxPendingSendRequests(int requestedSize,[Function responseFactory = null]);
  void receiveMore(int datagramNumber);
  Future<UdpSocketSendToResponseParams> sendTo(net_address_mojom.NetAddress destAddr,List<int> data,[Function responseFactory = null]);

}

class UdpSocketProxy extends bindings.Proxy implements UdpSocket {
  UdpSocketProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  UdpSocketProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  UdpSocketProxy.unbound() : super.unbound();

  String get name => UdpSocket.name;

  static UdpSocketProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new UdpSocketProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kUdpSocket_allowAddressReuse_name:
        var r = UdpSocketAllowAddressReuseResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      case kUdpSocket_bind_name:
        var r = UdpSocketBindResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      case kUdpSocket_connect_name:
        var r = UdpSocketConnectResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      case kUdpSocket_setSendBufferSize_name:
        var r = UdpSocketSetSendBufferSizeResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      case kUdpSocket_setReceiveBufferSize_name:
        var r = UdpSocketSetReceiveBufferSizeResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      case kUdpSocket_negotiateMaxPendingSendRequests_name:
        var r = UdpSocketNegotiateMaxPendingSendRequestsResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      case kUdpSocket_sendTo_name:
        var r = UdpSocketSendToResponseParams.deserialize(
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
  Future<UdpSocketAllowAddressReuseResponseParams> allowAddressReuse([Function responseFactory = null]) {
    var params = new UdpSocketAllowAddressReuseParams();
    return sendMessageWithRequestId(
        params,
        kUdpSocket_allowAddressReuse_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  Future<UdpSocketBindResponseParams> bind(net_address_mojom.NetAddress addr,[Function responseFactory = null]) {
    var params = new UdpSocketBindParams();
    params.addr = addr;
    return sendMessageWithRequestId(
        params,
        kUdpSocket_bind_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  Future<UdpSocketConnectResponseParams> connect(net_address_mojom.NetAddress remoteAddr,[Function responseFactory = null]) {
    var params = new UdpSocketConnectParams();
    params.remoteAddr = remoteAddr;
    return sendMessageWithRequestId(
        params,
        kUdpSocket_connect_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  Future<UdpSocketSetSendBufferSizeResponseParams> setSendBufferSize(int size,[Function responseFactory = null]) {
    var params = new UdpSocketSetSendBufferSizeParams();
    params.size = size;
    return sendMessageWithRequestId(
        params,
        kUdpSocket_setSendBufferSize_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  Future<UdpSocketSetReceiveBufferSizeResponseParams> setReceiveBufferSize(int size,[Function responseFactory = null]) {
    var params = new UdpSocketSetReceiveBufferSizeParams();
    params.size = size;
    return sendMessageWithRequestId(
        params,
        kUdpSocket_setReceiveBufferSize_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  Future<UdpSocketNegotiateMaxPendingSendRequestsResponseParams> negotiateMaxPendingSendRequests(int requestedSize,[Function responseFactory = null]) {
    var params = new UdpSocketNegotiateMaxPendingSendRequestsParams();
    params.requestedSize = requestedSize;
    return sendMessageWithRequestId(
        params,
        kUdpSocket_negotiateMaxPendingSendRequests_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  void receiveMore(int datagramNumber) {
    var params = new UdpSocketReceiveMoreParams();
    params.datagramNumber = datagramNumber;
    sendMessage(params, kUdpSocket_receiveMore_name);
  }

  Future<UdpSocketSendToResponseParams> sendTo(net_address_mojom.NetAddress destAddr,List<int> data,[Function responseFactory = null]) {
    var params = new UdpSocketSendToParams();
    params.destAddr = destAddr;
    params.data = data;
    return sendMessageWithRequestId(
        params,
        kUdpSocket_sendTo_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
}

class UdpSocketStub extends bindings.Stub {
  UdpSocket _delegate = null;

  UdpSocketStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  UdpSocketStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  UdpSocketStub.unbound() : super.unbound();

  static UdpSocketStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new UdpSocketStub(endpoint);

  static const String name = UdpSocket.name;


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
    assert(_delegate != null);
    switch (message.header.type) {
      case kUdpSocket_allowAddressReuse_name:
        var params = UdpSocketAllowAddressReuseParams.deserialize(
            message.payload);
        return _delegate.allowAddressReuse(_UdpSocketAllowAddressReuseResponseParamsFactory).then((response) {
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
        return _delegate.bind(params.addr,_UdpSocketBindResponseParamsFactory).then((response) {
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
        return _delegate.connect(params.remoteAddr,_UdpSocketConnectResponseParamsFactory).then((response) {
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
        return _delegate.setSendBufferSize(params.size,_UdpSocketSetSendBufferSizeResponseParamsFactory).then((response) {
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
        return _delegate.setReceiveBufferSize(params.size,_UdpSocketSetReceiveBufferSizeResponseParamsFactory).then((response) {
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
        return _delegate.negotiateMaxPendingSendRequests(params.requestedSize,_UdpSocketNegotiateMaxPendingSendRequestsResponseParamsFactory).then((response) {
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
        _delegate.receiveMore(params.datagramNumber);
        break;
      case kUdpSocket_sendTo_name:
        var params = UdpSocketSendToParams.deserialize(
            message.payload);
        return _delegate.sendTo(params.destAddr,params.data,_UdpSocketSendToResponseParamsFactory).then((response) {
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

  UdpSocket get delegate => _delegate;
      set delegate(UdpSocket d) {
    assert(_delegate == null);
    _delegate = d;
  }
}

const int kUdpSocketReceiver_onReceived_name = 0;

abstract class UdpSocketReceiver implements core.Listener {
  static const String name = 'mojo::UdpSocketReceiver';
  UdpSocketReceiverStub stub;

  UdpSocketReceiver(core.MojoMessagePipeEndpoint endpoint) :
      stub = new UdpSocketReceiverStub(endpoint);

  UdpSocketReceiver.fromHandle(core.MojoHandle handle) :
      stub = new UdpSocketReceiverStub.fromHandle(handle);

  UdpSocketReceiver.fromStub(this.stub);

  UdpSocketReceiver.unbound() :
      stub = new UdpSocketReceiverStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen({Function onClosed}) =>
      stub.listen(onClosed: onClosed);

  UdpSocketReceiver get delegate => stub.delegate;
  set delegate(UdpSocketReceiver d) {
    stub.delegate = d;
  }
  void onReceived(network_error_mojom.NetworkError result, net_address_mojom.NetAddress srcAddr, List<int> data);

}

class UdpSocketReceiverProxy extends bindings.Proxy implements UdpSocketReceiver {
  UdpSocketReceiverProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  UdpSocketReceiverProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  UdpSocketReceiverProxy.unbound() : super.unbound();

  String get name => UdpSocketReceiver.name;

  static UdpSocketReceiverProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new UdpSocketReceiverProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
  void onReceived(network_error_mojom.NetworkError result, net_address_mojom.NetAddress srcAddr, List<int> data) {
    var params = new UdpSocketReceiverOnReceivedParams();
    params.result = result;
    params.srcAddr = srcAddr;
    params.data = data;
    sendMessage(params, kUdpSocketReceiver_onReceived_name);
  }

}

class UdpSocketReceiverStub extends bindings.Stub {
  UdpSocketReceiver _delegate = null;

  UdpSocketReceiverStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  UdpSocketReceiverStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  UdpSocketReceiverStub.unbound() : super.unbound();

  static UdpSocketReceiverStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new UdpSocketReceiverStub(endpoint);

  static const String name = UdpSocketReceiver.name;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kUdpSocketReceiver_onReceived_name:
        var params = UdpSocketReceiverOnReceivedParams.deserialize(
            message.payload);
        _delegate.onReceived(params.result, params.srcAddr, params.data);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  UdpSocketReceiver get delegate => _delegate;
      set delegate(UdpSocketReceiver d) {
    assert(_delegate == null);
    _delegate = d;
  }
}


PK     cZFB��T  T  =   mojo/services/network/public/interfaces/url_loader.mojom.dart// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library url_loader.mojom;

import 'dart:async';
import 'mojo:bindings' as bindings;
import 'mojo:core' as core;
import 'package:mojo/services/network/public/interfaces/network_error.mojom.dart' as network_error_mojom;


class UrlRequest extends bindings.Struct {
  static const int kStructSize = 48;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 7);
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
        (mainDataHeader.version < 7)) {
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
}

class UrlResponse extends bindings.Struct {
  static const int kStructSize = 80;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 10);
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
        (mainDataHeader.version < 10)) {
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
}

class UrlLoaderStatus extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
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
        (mainDataHeader.version < 2)) {
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
}

class UrlLoaderStartParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
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
        (mainDataHeader.version < 1)) {
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
}

class UrlLoaderStartResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
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
        (mainDataHeader.version < 1)) {
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
}

class UrlLoaderFollowRedirectResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
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
        (mainDataHeader.version < 1)) {
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
}

class UrlLoaderQueryStatusResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
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
        (mainDataHeader.version < 1)) {
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
}
const int kUrlLoader_start_name = 0;
const int kUrlLoader_followRedirect_name = 1;
const int kUrlLoader_queryStatus_name = 2;

abstract class UrlLoader implements core.Listener {
  static const String name = 'mojo::UrlLoader';
  UrlLoaderStub stub;

  UrlLoader(core.MojoMessagePipeEndpoint endpoint) :
      stub = new UrlLoaderStub(endpoint);

  UrlLoader.fromHandle(core.MojoHandle handle) :
      stub = new UrlLoaderStub.fromHandle(handle);

  UrlLoader.fromStub(this.stub);

  UrlLoader.unbound() :
      stub = new UrlLoaderStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen({Function onClosed}) =>
      stub.listen(onClosed: onClosed);

  UrlLoader get delegate => stub.delegate;
  set delegate(UrlLoader d) {
    stub.delegate = d;
  }
  Future<UrlLoaderStartResponseParams> start(UrlRequest request,[Function responseFactory = null]);
  Future<UrlLoaderFollowRedirectResponseParams> followRedirect([Function responseFactory = null]);
  Future<UrlLoaderQueryStatusResponseParams> queryStatus([Function responseFactory = null]);

}

class UrlLoaderProxy extends bindings.Proxy implements UrlLoader {
  UrlLoaderProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  UrlLoaderProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  UrlLoaderProxy.unbound() : super.unbound();

  String get name => UrlLoader.name;

  static UrlLoaderProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new UrlLoaderProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kUrlLoader_start_name:
        var r = UrlLoaderStartResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      case kUrlLoader_followRedirect_name:
        var r = UrlLoaderFollowRedirectResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      case kUrlLoader_queryStatus_name:
        var r = UrlLoaderQueryStatusResponseParams.deserialize(
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
  Future<UrlLoaderStartResponseParams> start(UrlRequest request,[Function responseFactory = null]) {
    var params = new UrlLoaderStartParams();
    params.request = request;
    return sendMessageWithRequestId(
        params,
        kUrlLoader_start_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  Future<UrlLoaderFollowRedirectResponseParams> followRedirect([Function responseFactory = null]) {
    var params = new UrlLoaderFollowRedirectParams();
    return sendMessageWithRequestId(
        params,
        kUrlLoader_followRedirect_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  Future<UrlLoaderQueryStatusResponseParams> queryStatus([Function responseFactory = null]) {
    var params = new UrlLoaderQueryStatusParams();
    return sendMessageWithRequestId(
        params,
        kUrlLoader_queryStatus_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
}

class UrlLoaderStub extends bindings.Stub {
  UrlLoader _delegate = null;

  UrlLoaderStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  UrlLoaderStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  UrlLoaderStub.unbound() : super.unbound();

  static UrlLoaderStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new UrlLoaderStub(endpoint);

  static const String name = UrlLoader.name;


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
    assert(_delegate != null);
    switch (message.header.type) {
      case kUrlLoader_start_name:
        var params = UrlLoaderStartParams.deserialize(
            message.payload);
        return _delegate.start(params.request,_UrlLoaderStartResponseParamsFactory).then((response) {
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
        return _delegate.followRedirect(_UrlLoaderFollowRedirectResponseParamsFactory).then((response) {
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
        return _delegate.queryStatus(_UrlLoaderQueryStatusResponseParamsFactory).then((response) {
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

  UrlLoader get delegate => _delegate;
      set delegate(UrlLoader d) {
    assert(_delegate == null);
    _delegate = d;
  }
}


PK     cZF-�;Q�Z  �Z  =   mojo/services/network/public/interfaces/web_socket.mojom.dart// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library web_socket.mojom;

import 'dart:async';
import 'mojo:bindings' as bindings;
import 'mojo:core' as core;
import 'package:mojo/services/network/public/interfaces/network_error.mojom.dart' as network_error_mojom;


class WebSocketConnectParams extends bindings.Struct {
  static const int kStructSize = 40;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 5);
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
        (mainDataHeader.version < 5)) {
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
}

class WebSocketSendParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 3);
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
        (mainDataHeader.version < 3)) {
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
}

class WebSocketFlowControlParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
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
        (mainDataHeader.version < 1)) {
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
}

class WebSocketCloseParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
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
        (mainDataHeader.version < 2)) {
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
}

class WebSocketClientDidConnectParams extends bindings.Struct {
  static const int kStructSize = 32;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 4);
  bool fail = false;
  core.MojoDataPipeConsumer receiveStream = null;
  String selectedSubprotocol = null;
  String extensions = null;

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
        (mainDataHeader.version < 4)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.fail = decoder0.decodeBool(8, 0);
    }
    {
      
      result.receiveStream = decoder0.decodeConsumerHandle(12, false);
    }
    {
      
      result.selectedSubprotocol = decoder0.decodeString(16, false);
    }
    {
      
      result.extensions = decoder0.decodeString(24, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeBool(fail, 8, 0);
    
    encoder0.encodeConsumerHandle(receiveStream, 12, false);
    
    encoder0.encodeString(selectedSubprotocol, 16, false);
    
    encoder0.encodeString(extensions, 24, false);
  }
}

class WebSocketClientDidReceiveDataParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 3);
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
        (mainDataHeader.version < 3)) {
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
}

class WebSocketClientDidReceiveFlowControlParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
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
        (mainDataHeader.version < 1)) {
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
}

class WebSocketClientDidFailParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
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
        (mainDataHeader.version < 1)) {
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
}

class WebSocketClientDidCloseParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 3);
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
        (mainDataHeader.version < 3)) {
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
}
const int kWebSocket_connect_name = 0;
const int kWebSocket_send_name = 1;
const int kWebSocket_flowControl_name = 2;
const int kWebSocket_close_name = 3;

abstract class WebSocket implements core.Listener {
  static const String name = 'mojo::WebSocket';
  WebSocketStub stub;

  WebSocket(core.MojoMessagePipeEndpoint endpoint) :
      stub = new WebSocketStub(endpoint);

  WebSocket.fromHandle(core.MojoHandle handle) :
      stub = new WebSocketStub.fromHandle(handle);

  WebSocket.fromStub(this.stub);

  WebSocket.unbound() :
      stub = new WebSocketStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen({Function onClosed}) =>
      stub.listen(onClosed: onClosed);

  WebSocket get delegate => stub.delegate;
  set delegate(WebSocket d) {
    stub.delegate = d;
  }
  void connect(String url, List<String> protocols, String origin, core.MojoDataPipeConsumer sendStream, Object client);
  void send(bool fin, int type, int numBytes);
  void flowControl(int quota);
  void close(int code, String reason);

  static final ABNORMAL_CLOSE_CODE = 1006;
  
  static final int MessageType_CONTINUATION = 0;
  static final int MessageType_TEXT = MessageType_CONTINUATION + 1;
  static final int MessageType_BINARY = MessageType_TEXT + 1;
}

class WebSocketProxy extends bindings.Proxy implements WebSocket {
  WebSocketProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  WebSocketProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  WebSocketProxy.unbound() : super.unbound();

  String get name => WebSocket.name;

  static WebSocketProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new WebSocketProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
  void connect(String url, List<String> protocols, String origin, core.MojoDataPipeConsumer sendStream, Object client) {
    var params = new WebSocketConnectParams();
    params.url = url;
    params.protocols = protocols;
    params.origin = origin;
    params.sendStream = sendStream;
    params.client = client;
    sendMessage(params, kWebSocket_connect_name);
  }

  void send(bool fin, int type, int numBytes) {
    var params = new WebSocketSendParams();
    params.fin = fin;
    params.type = type;
    params.numBytes = numBytes;
    sendMessage(params, kWebSocket_send_name);
  }

  void flowControl(int quota) {
    var params = new WebSocketFlowControlParams();
    params.quota = quota;
    sendMessage(params, kWebSocket_flowControl_name);
  }

  void close(int code, String reason) {
    var params = new WebSocketCloseParams();
    params.code = code;
    params.reason = reason;
    sendMessage(params, kWebSocket_close_name);
  }

}

class WebSocketStub extends bindings.Stub {
  WebSocket _delegate = null;

  WebSocketStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  WebSocketStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  WebSocketStub.unbound() : super.unbound();

  static WebSocketStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new WebSocketStub(endpoint);

  static const String name = WebSocket.name;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kWebSocket_connect_name:
        var params = WebSocketConnectParams.deserialize(
            message.payload);
        _delegate.connect(params.url, params.protocols, params.origin, params.sendStream, params.client);
        break;
      case kWebSocket_send_name:
        var params = WebSocketSendParams.deserialize(
            message.payload);
        _delegate.send(params.fin, params.type, params.numBytes);
        break;
      case kWebSocket_flowControl_name:
        var params = WebSocketFlowControlParams.deserialize(
            message.payload);
        _delegate.flowControl(params.quota);
        break;
      case kWebSocket_close_name:
        var params = WebSocketCloseParams.deserialize(
            message.payload);
        _delegate.close(params.code, params.reason);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  WebSocket get delegate => _delegate;
      set delegate(WebSocket d) {
    assert(_delegate == null);
    _delegate = d;
  }
}

const int kWebSocketClient_didConnect_name = 0;
const int kWebSocketClient_didReceiveData_name = 1;
const int kWebSocketClient_didReceiveFlowControl_name = 2;
const int kWebSocketClient_didFail_name = 3;
const int kWebSocketClient_didClose_name = 4;

abstract class WebSocketClient implements core.Listener {
  static const String name = 'mojo::WebSocketClient';
  WebSocketClientStub stub;

  WebSocketClient(core.MojoMessagePipeEndpoint endpoint) :
      stub = new WebSocketClientStub(endpoint);

  WebSocketClient.fromHandle(core.MojoHandle handle) :
      stub = new WebSocketClientStub.fromHandle(handle);

  WebSocketClient.fromStub(this.stub);

  WebSocketClient.unbound() :
      stub = new WebSocketClientStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen({Function onClosed}) =>
      stub.listen(onClosed: onClosed);

  WebSocketClient get delegate => stub.delegate;
  set delegate(WebSocketClient d) {
    stub.delegate = d;
  }
  void didConnect(bool fail, String selectedSubprotocol, String extensions, core.MojoDataPipeConsumer receiveStream);
  void didReceiveData(bool fin, int type, int numBytes);
  void didReceiveFlowControl(int quota);
  void didFail(String message);
  void didClose(bool wasClean, int code, String reason);

}

class WebSocketClientProxy extends bindings.Proxy implements WebSocketClient {
  WebSocketClientProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  WebSocketClientProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  WebSocketClientProxy.unbound() : super.unbound();

  String get name => WebSocketClient.name;

  static WebSocketClientProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new WebSocketClientProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
  void didConnect(bool fail, String selectedSubprotocol, String extensions, core.MojoDataPipeConsumer receiveStream) {
    var params = new WebSocketClientDidConnectParams();
    params.fail = fail;
    params.selectedSubprotocol = selectedSubprotocol;
    params.extensions = extensions;
    params.receiveStream = receiveStream;
    sendMessage(params, kWebSocketClient_didConnect_name);
  }

  void didReceiveData(bool fin, int type, int numBytes) {
    var params = new WebSocketClientDidReceiveDataParams();
    params.fin = fin;
    params.type = type;
    params.numBytes = numBytes;
    sendMessage(params, kWebSocketClient_didReceiveData_name);
  }

  void didReceiveFlowControl(int quota) {
    var params = new WebSocketClientDidReceiveFlowControlParams();
    params.quota = quota;
    sendMessage(params, kWebSocketClient_didReceiveFlowControl_name);
  }

  void didFail(String message) {
    var params = new WebSocketClientDidFailParams();
    params.message = message;
    sendMessage(params, kWebSocketClient_didFail_name);
  }

  void didClose(bool wasClean, int code, String reason) {
    var params = new WebSocketClientDidCloseParams();
    params.wasClean = wasClean;
    params.code = code;
    params.reason = reason;
    sendMessage(params, kWebSocketClient_didClose_name);
  }

}

class WebSocketClientStub extends bindings.Stub {
  WebSocketClient _delegate = null;

  WebSocketClientStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  WebSocketClientStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  WebSocketClientStub.unbound() : super.unbound();

  static WebSocketClientStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new WebSocketClientStub(endpoint);

  static const String name = WebSocketClient.name;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kWebSocketClient_didConnect_name:
        var params = WebSocketClientDidConnectParams.deserialize(
            message.payload);
        _delegate.didConnect(params.fail, params.selectedSubprotocol, params.extensions, params.receiveStream);
        break;
      case kWebSocketClient_didReceiveData_name:
        var params = WebSocketClientDidReceiveDataParams.deserialize(
            message.payload);
        _delegate.didReceiveData(params.fin, params.type, params.numBytes);
        break;
      case kWebSocketClient_didReceiveFlowControl_name:
        var params = WebSocketClientDidReceiveFlowControlParams.deserialize(
            message.payload);
        _delegate.didReceiveFlowControl(params.quota);
        break;
      case kWebSocketClient_didFail_name:
        var params = WebSocketClientDidFailParams.deserialize(
            message.payload);
        _delegate.didFail(params.message);
        break;
      case kWebSocketClient_didClose_name:
        var params = WebSocketClientDidCloseParams.deserialize(
            message.payload);
        _delegate.didClose(params.wasClean, params.code, params.reason);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  WebSocketClient get delegate => _delegate;
      set delegate(WebSocketClient d) {
    assert(_delegate == null);
    _delegate = d;
  }
}


PK     �zYF��O)H  H  	           ��    main.dartPK     cZF��]$  $  9           �o  mojo/public/interfaces/application/application.mojom.dartPK     cZFH���Z  Z  >           ��,  mojo/public/interfaces/application/service_provider.mojom.dartPK     cZFDB";�  �  3           ��?  mojo/public/interfaces/application/shell.mojom.dartPK     cZF�����'  �'  ?           ��R  mojo/services/network/public/interfaces/cookie_store.mojom.dartPK     cZFQ��P�  �  >           ��z  mojo/services/network/public/interfaces/net_address.mojom.dartPK     cZF�ݫ��  �  @           ��  mojo/services/network/public/interfaces/network_error.mojom.dartPK     cZF_��U  U  B           ��  mojo/services/network/public/interfaces/network_service.mojom.dartPK     cZFjWmx1  x1  C           �^�  mojo/services/network/public/interfaces/tcp_bound_socket.mojom.dartPK     cZFK���
  �
  G           �7 mojo/services/network/public/interfaces/tcp_connected_socket.mojom.dartPK     cZF�?"��  �  D           �^$ mojo/services/network/public/interfaces/tcp_server_socket.mojom.dartPK     cZF���̚  ̚  =           ��D mojo/services/network/public/interfaces/udp_socket.mojom.dartPK     cZFB��T  T  =           ��� mojo/services/network/public/interfaces/url_loader.mojom.dartPK     cZF-�;Q�Z  �Z  =           �@4 mojo/services/network/public/interfaces/web_socket.mojom.dartPK      �  @�   