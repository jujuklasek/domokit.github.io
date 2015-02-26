// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library window_manager.mojom;

import 'dart:async';
import 'mojo:bindings' as bindings;
import 'mojo:core' as core;
import 'package:mojo/services/geometry/public/interfaces/geometry.mojom.dart' as geometry_mojom;


class IWindowManagerCloseWindowParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  int nodeId = 0;

  IWindowManagerCloseWindowParams() : super(kStructSize);

  static IWindowManagerCloseWindowParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static IWindowManagerCloseWindowParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    IWindowManagerCloseWindowParams result = new IWindowManagerCloseWindowParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.nodeId = decoder0.decodeUint32(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint32(nodeId, 8);
  }
}
const int kIWindowManager_closeWindow_name = 0;

abstract class IWindowManager implements core.Listener {
  static const String name = 'mojo::IWindowManager';
  IWindowManagerStub stub;

  IWindowManager(core.MojoMessagePipeEndpoint endpoint) :
      stub = new IWindowManagerStub(endpoint);

  IWindowManager.fromHandle(core.MojoHandle handle) :
      stub = new IWindowManagerStub.fromHandle(handle);

  IWindowManager.fromStub(this.stub);

  IWindowManager.unbound() :
      stub = new IWindowManagerStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen({Function onClosed}) =>
      stub.listen(onClosed: onClosed);

  IWindowManager get delegate => stub.delegate;
  set delegate(IWindowManager d) {
    stub.delegate = d;
  }
  void closeWindow(int nodeId);

}

class IWindowManagerProxy extends bindings.Proxy implements IWindowManager {
  IWindowManagerProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  IWindowManagerProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  IWindowManagerProxy.unbound() : super.unbound();

  String get name => IWindowManager.name;

  static IWindowManagerProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new IWindowManagerProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
  void closeWindow(int nodeId) {
    var params = new IWindowManagerCloseWindowParams();
    params.nodeId = nodeId;
    sendMessage(params, kIWindowManager_closeWindow_name);
  }

}

class IWindowManagerStub extends bindings.Stub {
  IWindowManager _delegate = null;

  IWindowManagerStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  IWindowManagerStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  IWindowManagerStub.unbound() : super.unbound();

  static IWindowManagerStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new IWindowManagerStub(endpoint);

  static const String name = IWindowManager.name;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kIWindowManager_closeWindow_name:
        var params = IWindowManagerCloseWindowParams.deserialize(
            message.payload);
        _delegate.closeWindow(params.nodeId);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  IWindowManager get delegate => _delegate;
      set delegate(IWindowManager d) {
    assert(_delegate == null);
    _delegate = d;
  }
}


