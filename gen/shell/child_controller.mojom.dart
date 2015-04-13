// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library child_controller.mojom;

import 'dart:async';

import 'package:mojo/public/dart/bindings.dart' as bindings;
import 'package:mojo/public/dart/core.dart' as core;
import 'package:mojo/public/interfaces/application/application.mojom.dart' as application_mojom;


class ChildControllerStartAppParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String appPath = null;
  bool cleanAppPath = false;
  Object applicationRequest = null;

  ChildControllerStartAppParams() : super(kVersions.last.size);

  static ChildControllerStartAppParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ChildControllerStartAppParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ChildControllerStartAppParams result = new ChildControllerStartAppParams();

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
    return "ChildControllerStartAppParams("
           "appPath: $appPath" ", "
           "cleanAppPath: $cleanAppPath" ", "
           "applicationRequest: $applicationRequest" ")";
  }
}

class ChildControllerStartAppResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  int result = 0;

  ChildControllerStartAppResponseParams() : super(kVersions.last.size);

  static ChildControllerStartAppResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ChildControllerStartAppResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ChildControllerStartAppResponseParams result = new ChildControllerStartAppResponseParams();

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
    return "ChildControllerStartAppResponseParams("
           "result: $result" ")";
  }
}

class ChildControllerExitNowParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  int exitCode = 0;

  ChildControllerExitNowParams() : super(kVersions.last.size);

  static ChildControllerExitNowParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ChildControllerExitNowParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ChildControllerExitNowParams result = new ChildControllerExitNowParams();

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
    return "ChildControllerExitNowParams("
           "exitCode: $exitCode" ")";
  }
}
const int kChildController_startApp_name = 0;
const int kChildController_exitNow_name = 1;

const String ChildControllerName =
      'shell::ChildController';

abstract class ChildController {
  Future<ChildControllerStartAppResponseParams> startApp(String appPath,bool cleanAppPath,Object applicationRequest,[Function responseFactory = null]);
  void exitNow(int exitCode);

}


class ChildControllerProxyImpl extends bindings.Proxy {
  ChildControllerProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  ChildControllerProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  ChildControllerProxyImpl.unbound() : super.unbound();

  static ChildControllerProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ChildControllerProxyImpl.fromEndpoint(endpoint);

  String get name => ChildControllerName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kChildController_startApp_name:
        var r = ChildControllerStartAppResponseParams.deserialize(
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
    return "ChildControllerProxyImpl($superString)";
  }
}


class _ChildControllerProxyCalls implements ChildController {
  ChildControllerProxyImpl _proxyImpl;

  _ChildControllerProxyCalls(this._proxyImpl);
    Future<ChildControllerStartAppResponseParams> startApp(String appPath,bool cleanAppPath,Object applicationRequest,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new ChildControllerStartAppParams();
      params.appPath = appPath;
      params.cleanAppPath = cleanAppPath;
      params.applicationRequest = applicationRequest;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kChildController_startApp_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    void exitNow(int exitCode) {
      assert(_proxyImpl.isBound);
      var params = new ChildControllerExitNowParams();
      params.exitCode = exitCode;
      _proxyImpl.sendMessage(params, kChildController_exitNow_name);
    }
  
}


class ChildControllerProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  ChildController ptr;
  final String name = ChildControllerName;

  ChildControllerProxy(ChildControllerProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _ChildControllerProxyCalls(proxyImpl);

  ChildControllerProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new ChildControllerProxyImpl.fromEndpoint(endpoint) {
    ptr = new _ChildControllerProxyCalls(impl);
  }

  ChildControllerProxy.fromHandle(core.MojoHandle handle) :
      impl = new ChildControllerProxyImpl.fromHandle(handle) {
    ptr = new _ChildControllerProxyCalls(impl);
  }

  ChildControllerProxy.unbound() :
      impl = new ChildControllerProxyImpl.unbound() {
    ptr = new _ChildControllerProxyCalls(impl);
  }

  static ChildControllerProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ChildControllerProxy.fromEndpoint(endpoint);

  Future close({bool immediate: false}) => impl.close(immediate: immediate);

  String toString() {
    return "ChildControllerProxy($impl)";
  }
}


class ChildControllerStub extends bindings.Stub {
  ChildController _impl = null;

  ChildControllerStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  ChildControllerStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  ChildControllerStub.unbound() : super.unbound();

  static ChildControllerStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ChildControllerStub.fromEndpoint(endpoint);

  static const String name = ChildControllerName;


  ChildControllerStartAppResponseParams _ChildControllerStartAppResponseParamsFactory(int result) {
    var result = new ChildControllerStartAppResponseParams();
    result.result = result;
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_impl != null);
    switch (message.header.type) {
      case kChildController_startApp_name:
        var params = ChildControllerStartAppParams.deserialize(
            message.payload);
        return _impl.startApp(params.appPath,params.cleanAppPath,params.applicationRequest,_ChildControllerStartAppResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kChildController_startApp_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kChildController_exitNow_name:
        var params = ChildControllerExitNowParams.deserialize(
            message.payload);
        _impl.exitNow(params.exitCode);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  ChildController get impl => _impl;
      set impl(ChildController d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "ChildControllerStub($superString)";
  }
}


