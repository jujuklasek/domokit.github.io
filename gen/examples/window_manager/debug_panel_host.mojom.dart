// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library debug_panel_host.mojom;

import 'dart:async';
import 'dart:mojo_bindings' as bindings;
import 'dart:mojo_core' as core;
import 'package:mojo/services/navigation/public/interfaces/navigation.mojom.dart' as navigation_mojom;


class DebugPanelHostCloseTopWindowParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  DebugPanelHostCloseTopWindowParams() : super(kStructSize);

  static DebugPanelHostCloseTopWindowParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static DebugPanelHostCloseTopWindowParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    DebugPanelHostCloseTopWindowParams result = new DebugPanelHostCloseTopWindowParams();

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

class DebugPanelHostNavigateToParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  String url = null;

  DebugPanelHostNavigateToParams() : super(kStructSize);

  static DebugPanelHostNavigateToParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static DebugPanelHostNavigateToParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    DebugPanelHostNavigateToParams result = new DebugPanelHostNavigateToParams();

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

class DebugPanelHostSetNavigationTargetParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  int target = 0;

  DebugPanelHostSetNavigationTargetParams() : super(kStructSize);

  static DebugPanelHostSetNavigationTargetParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static DebugPanelHostSetNavigationTargetParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    DebugPanelHostSetNavigationTargetParams result = new DebugPanelHostSetNavigationTargetParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.target = decoder0.decodeInt32(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInt32(target, 8);
  }
}
const int kDebugPanelHost_closeTopWindow_name = 0;
const int kDebugPanelHost_navigateTo_name = 1;
const int kDebugPanelHost_setNavigationTarget_name = 2;

abstract class DebugPanelHost implements core.Listener {
  static const String name = 'mojo::examples::DebugPanelHost';
  DebugPanelHostStub stub;

  DebugPanelHost(core.MojoMessagePipeEndpoint endpoint) :
      stub = new DebugPanelHostStub(endpoint);

  DebugPanelHost.fromHandle(core.MojoHandle handle) :
      stub = new DebugPanelHostStub.fromHandle(handle);

  DebugPanelHost.fromStub(this.stub);

  DebugPanelHost.unbound() :
      stub = new DebugPanelHostStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  DebugPanelHost get delegate => stub.delegate;
  set delegate(DebugPanelHost d) {
    stub.delegate = d;
  }
  void closeTopWindow();
  void navigateTo(String url);
  void setNavigationTarget(int target);

}

class DebugPanelHostProxy extends bindings.Proxy implements DebugPanelHost {
  DebugPanelHostProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  DebugPanelHostProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  DebugPanelHostProxy.unbound() : super.unbound();

  String get name => DebugPanelHost.name;

  static DebugPanelHostProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new DebugPanelHostProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
  void closeTopWindow() {
    var params = new DebugPanelHostCloseTopWindowParams();
    sendMessage(params, kDebugPanelHost_closeTopWindow_name);
  }

  void navigateTo(String url) {
    var params = new DebugPanelHostNavigateToParams();
    params.url = url;
    sendMessage(params, kDebugPanelHost_navigateTo_name);
  }

  void setNavigationTarget(int target) {
    var params = new DebugPanelHostSetNavigationTargetParams();
    params.target = target;
    sendMessage(params, kDebugPanelHost_setNavigationTarget_name);
  }

}

class DebugPanelHostStub extends bindings.Stub {
  DebugPanelHost _delegate = null;

  DebugPanelHostStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  DebugPanelHostStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  DebugPanelHostStub.unbound() : super.unbound();

  static DebugPanelHostStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new DebugPanelHostStub(endpoint);

  static const String name = DebugPanelHost.name;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kDebugPanelHost_closeTopWindow_name:
        var params = DebugPanelHostCloseTopWindowParams.deserialize(
            message.payload);
        _delegate.closeTopWindow();
        break;
      case kDebugPanelHost_navigateTo_name:
        var params = DebugPanelHostNavigateToParams.deserialize(
            message.payload);
        _delegate.navigateTo(params.url);
        break;
      case kDebugPanelHost_setNavigationTarget_name:
        var params = DebugPanelHostSetNavigationTargetParams.deserialize(
            message.payload);
        _delegate.setNavigationTarget(params.target);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  DebugPanelHost get delegate => _delegate;
      set delegate(DebugPanelHost d) {
    assert(_delegate == null);
    _delegate = d;
  }
}




