// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library app_child_process.mojom;

import 'dart:async';
import 'mojo:bindings' as bindings;
import 'mojo:core' as core;
import 'package:mojo/public/interfaces/application/application.mojom.dart' as application_mojom;


class AppChildControllerStartAppParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 3);
  String appPath = null;
  bool cleanAppPath = false;
  Object applicationRequest = null;

  AppChildControllerStartAppParams() : super(kStructSize);

  static AppChildControllerStartAppParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static AppChildControllerStartAppParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    AppChildControllerStartAppParams result = new AppChildControllerStartAppParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 3)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.appPath = decoder0.decodeString(8, false);
    }
    {
      
      result.cleanAppPath = decoder0.decodeBool(16, 0);
    }
    {
      
      result.applicationRequest = decoder0.decodeInterfaceRequest(20, false, application_mojom.ApplicationStub.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeString(appPath, 8, false);
    
    encoder0.encodeBool(cleanAppPath, 16, 0);
    
    encoder0.encodeInterfaceRequest(applicationRequest, 20, false);
  }
}

class AppChildControllerStartAppResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  int result = 0;

  AppChildControllerStartAppResponseParams() : super(kStructSize);

  static AppChildControllerStartAppResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static AppChildControllerStartAppResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    AppChildControllerStartAppResponseParams result = new AppChildControllerStartAppResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.result = decoder0.decodeInt32(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInt32(result, 8);
  }
}
const int kAppChildController_startApp_name = 0;

abstract class AppChildController implements core.Listener {
  static const String name = 'mojo::shell::AppChildController';
  AppChildControllerStub stub;

  AppChildController(core.MojoMessagePipeEndpoint endpoint) :
      stub = new AppChildControllerStub(endpoint);

  AppChildController.fromHandle(core.MojoHandle handle) :
      stub = new AppChildControllerStub.fromHandle(handle);

  AppChildController.fromStub(this.stub);

  AppChildController.unbound() :
      stub = new AppChildControllerStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen({Function onClosed}) =>
      stub.listen(onClosed: onClosed);

  AppChildController get delegate => stub.delegate;
  set delegate(AppChildController d) {
    stub.delegate = d;
  }
  Future<AppChildControllerStartAppResponseParams> startApp(String appPath,bool cleanAppPath,Object applicationRequest,[Function responseFactory = null]);

}

class AppChildControllerProxy extends bindings.Proxy implements AppChildController {
  AppChildControllerProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  AppChildControllerProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  AppChildControllerProxy.unbound() : super.unbound();

  String get name => AppChildController.name;

  static AppChildControllerProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new AppChildControllerProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kAppChildController_startApp_name:
        var r = AppChildControllerStartAppResponseParams.deserialize(
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
  Future<AppChildControllerStartAppResponseParams> startApp(String appPath,bool cleanAppPath,Object applicationRequest,[Function responseFactory = null]) {
    var params = new AppChildControllerStartAppParams();
    params.appPath = appPath;
    params.cleanAppPath = cleanAppPath;
    params.applicationRequest = applicationRequest;
    return sendMessageWithRequestId(
        params,
        kAppChildController_startApp_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
}

class AppChildControllerStub extends bindings.Stub {
  AppChildController _delegate = null;

  AppChildControllerStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  AppChildControllerStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  AppChildControllerStub.unbound() : super.unbound();

  static AppChildControllerStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new AppChildControllerStub(endpoint);

  static const String name = AppChildController.name;


  AppChildControllerStartAppResponseParams _AppChildControllerStartAppResponseParamsFactory(int result) {
    var result = new AppChildControllerStartAppResponseParams();
    result.result = result;
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kAppChildController_startApp_name:
        var params = AppChildControllerStartAppParams.deserialize(
            message.payload);
        return _delegate.startApp(params.appPath,params.cleanAppPath,params.applicationRequest,_AppChildControllerStartAppResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kAppChildController_startApp_name,
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

  AppChildController get delegate => _delegate;
      set delegate(AppChildController d) {
    assert(_delegate == null);
    _delegate = d;
  }
}


