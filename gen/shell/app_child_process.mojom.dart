// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library app_child_process.mojom;

import 'dart:async';

import 'package:mojo/public/dart/bindings.dart' as bindings;
import 'package:mojo/public/dart/core.dart' as core;
import 'package:mojo/public/interfaces/application/application.mojom.dart' as application_mojom;


class AppChildControllerStartAppParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String appPath = null;
  bool cleanAppPath = false;
  Object applicationRequest = null;

  AppChildControllerStartAppParams() : super(kVersions.last.size);

  static AppChildControllerStartAppParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static AppChildControllerStartAppParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    AppChildControllerStartAppParams result = new AppChildControllerStartAppParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size != kVersions[i].size)
            throw new bindings.MojoCodecError(
                'Header doesn\'t correspond to any known version.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      result.appPath = decoder0.decodeString(8, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.cleanAppPath = decoder0.decodeBool(16, 0);
    }
    if (mainDataHeader.version >= 0) {
      
      result.applicationRequest = decoder0.decodeInterfaceRequest(20, false, application_mojom.ApplicationStub.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(appPath, 8, false);
    
    encoder0.encodeBool(cleanAppPath, 16, 0);
    
    encoder0.encodeInterfaceRequest(applicationRequest, 20, false);
  }

  String toString() {
    return "AppChildControllerStartAppParams("
           "appPath: $appPath" ", "
           "cleanAppPath: $cleanAppPath" ", "
           "applicationRequest: $applicationRequest" ")";
  }
}

class AppChildControllerStartAppResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  int result = 0;

  AppChildControllerStartAppResponseParams() : super(kVersions.last.size);

  static AppChildControllerStartAppResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static AppChildControllerStartAppResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    AppChildControllerStartAppResponseParams result = new AppChildControllerStartAppResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size != kVersions[i].size)
            throw new bindings.MojoCodecError(
                'Header doesn\'t correspond to any known version.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      result.result = decoder0.decodeInt32(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeInt32(result, 8);
  }

  String toString() {
    return "AppChildControllerStartAppResponseParams("
           "result: $result" ")";
  }
}

class AppChildControllerExitNowParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  int exitCode = 0;

  AppChildControllerExitNowParams() : super(kVersions.last.size);

  static AppChildControllerExitNowParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static AppChildControllerExitNowParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    AppChildControllerExitNowParams result = new AppChildControllerExitNowParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size != kVersions[i].size)
            throw new bindings.MojoCodecError(
                'Header doesn\'t correspond to any known version.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      result.exitCode = decoder0.decodeInt32(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeInt32(exitCode, 8);
  }

  String toString() {
    return "AppChildControllerExitNowParams("
           "exitCode: $exitCode" ")";
  }
}
const int kAppChildController_startApp_name = 0;
const int kAppChildController_exitNow_name = 1;

const String AppChildControllerName =
      'mojo::shell::AppChildController';

abstract class AppChildController {
  Future<AppChildControllerStartAppResponseParams> startApp(String appPath,bool cleanAppPath,Object applicationRequest,[Function responseFactory = null]);
  void exitNow(int exitCode);

}


class AppChildControllerProxyImpl extends bindings.Proxy {
  AppChildControllerProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  AppChildControllerProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  AppChildControllerProxyImpl.unbound() : super.unbound();

  static AppChildControllerProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new AppChildControllerProxyImpl.fromEndpoint(endpoint);

  String get name => AppChildControllerName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kAppChildController_startApp_name:
        var r = AppChildControllerStartAppResponseParams.deserialize(
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
    return "AppChildControllerProxyImpl($superString)";
  }
}


class _AppChildControllerProxyCalls implements AppChildController {
  AppChildControllerProxyImpl _proxyImpl;

  _AppChildControllerProxyCalls(this._proxyImpl);
    Future<AppChildControllerStartAppResponseParams> startApp(String appPath,bool cleanAppPath,Object applicationRequest,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new AppChildControllerStartAppParams();
      params.appPath = appPath;
      params.cleanAppPath = cleanAppPath;
      params.applicationRequest = applicationRequest;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kAppChildController_startApp_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    void exitNow(int exitCode) {
      assert(_proxyImpl.isBound);
      var params = new AppChildControllerExitNowParams();
      params.exitCode = exitCode;
      _proxyImpl.sendMessage(params, kAppChildController_exitNow_name);
    }
  
}


class AppChildControllerProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  AppChildController ptr;
  final String name = AppChildControllerName;

  AppChildControllerProxy(AppChildControllerProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _AppChildControllerProxyCalls(proxyImpl);

  AppChildControllerProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new AppChildControllerProxyImpl.fromEndpoint(endpoint) {
    ptr = new _AppChildControllerProxyCalls(impl);
  }

  AppChildControllerProxy.fromHandle(core.MojoHandle handle) :
      impl = new AppChildControllerProxyImpl.fromHandle(handle) {
    ptr = new _AppChildControllerProxyCalls(impl);
  }

  AppChildControllerProxy.unbound() :
      impl = new AppChildControllerProxyImpl.unbound() {
    ptr = new _AppChildControllerProxyCalls(impl);
  }

  static AppChildControllerProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new AppChildControllerProxy.fromEndpoint(endpoint);

  Future close({bool nodefer: false}) => impl.close(nodefer: nodefer);

  String toString() {
    return "AppChildControllerProxy($impl)";
  }
}


class AppChildControllerStub extends bindings.Stub {
  AppChildController _impl = null;

  AppChildControllerStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  AppChildControllerStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  AppChildControllerStub.unbound() : super.unbound();

  static AppChildControllerStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new AppChildControllerStub.fromEndpoint(endpoint);

  static const String name = AppChildControllerName;


  AppChildControllerStartAppResponseParams _AppChildControllerStartAppResponseParamsFactory(int result) {
    var result = new AppChildControllerStartAppResponseParams();
    result.result = result;
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_impl != null);
    switch (message.header.type) {
      case kAppChildController_startApp_name:
        var params = AppChildControllerStartAppParams.deserialize(
            message.payload);
        return _impl.startApp(params.appPath,params.cleanAppPath,params.applicationRequest,_AppChildControllerStartAppResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kAppChildController_startApp_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kAppChildController_exitNow_name:
        var params = AppChildControllerExitNowParams.deserialize(
            message.payload);
        _impl.exitNow(params.exitCode);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  AppChildController get impl => _impl;
      set impl(AppChildController d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "AppChildControllerStub($superString)";
  }
}


