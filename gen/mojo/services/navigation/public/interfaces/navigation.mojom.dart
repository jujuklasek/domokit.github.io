// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library navigation.mojom;

import 'dart:async';
import 'dart:mojo_bindings' as bindings;
import 'dart:mojo_core' as core;
import 'package:mojo/services/network/public/interfaces/url_loader.mojom.dart' as url_loader_mojom;

final int Target_DEFAULT = 0;
final int Target_SOURCE_NODE = Target_DEFAULT + 1;
final int Target_NEW_NODE = Target_SOURCE_NODE + 1;


class NavigatorHostRequestNavigateParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
  int target = 0;
  url_loader_mojom.UrlRequest request = null;

  NavigatorHostRequestNavigateParams() : super(kStructSize);

  static NavigatorHostRequestNavigateParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static NavigatorHostRequestNavigateParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    NavigatorHostRequestNavigateParams result = new NavigatorHostRequestNavigateParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 2)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.target = decoder0.decodeInt32(8);
    }
    {
      
      var decoder1 = decoder0.decodePointer(16, false);
      result.request = url_loader_mojom.UrlRequest.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInt32(target, 8);
    
    encoder0.encodeStruct(request, 16, false);
  }
}

class NavigatorHostDidNavigateLocallyParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  String url = null;

  NavigatorHostDidNavigateLocallyParams() : super(kStructSize);

  static NavigatorHostDidNavigateLocallyParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static NavigatorHostDidNavigateLocallyParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    NavigatorHostDidNavigateLocallyParams result = new NavigatorHostDidNavigateLocallyParams();

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
const int kNavigatorHost_requestNavigate_name = 0;
const int kNavigatorHost_didNavigateLocally_name = 1;

abstract class NavigatorHost implements core.Listener {
  static const String name = 'mojo::NavigatorHost';
  NavigatorHostStub stub;

  NavigatorHost(core.MojoMessagePipeEndpoint endpoint) :
      stub = new NavigatorHostStub(endpoint);

  NavigatorHost.fromHandle(core.MojoHandle handle) :
      stub = new NavigatorHostStub.fromHandle(handle);

  NavigatorHost.fromStub(this.stub);

  NavigatorHost.unbound() :
      stub = new NavigatorHostStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  NavigatorHost get delegate => stub.delegate;
  set delegate(NavigatorHost d) {
    stub.delegate = d;
  }
  void requestNavigate(int target, url_loader_mojom.UrlRequest request);
  void didNavigateLocally(String url);

}

class NavigatorHostProxy extends bindings.Proxy implements NavigatorHost {
  NavigatorHostProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  NavigatorHostProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  NavigatorHostProxy.unbound() : super.unbound();

  String get name => NavigatorHost.name;

  static NavigatorHostProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new NavigatorHostProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
  void requestNavigate(int target, url_loader_mojom.UrlRequest request) {
    var params = new NavigatorHostRequestNavigateParams();
    params.target = target;
    params.request = request;
    sendMessage(params, kNavigatorHost_requestNavigate_name);
  }

  void didNavigateLocally(String url) {
    var params = new NavigatorHostDidNavigateLocallyParams();
    params.url = url;
    sendMessage(params, kNavigatorHost_didNavigateLocally_name);
  }

}

class NavigatorHostStub extends bindings.Stub {
  NavigatorHost _delegate = null;

  NavigatorHostStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  NavigatorHostStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  NavigatorHostStub.unbound() : super.unbound();

  static NavigatorHostStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new NavigatorHostStub(endpoint);

  static const String name = NavigatorHost.name;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kNavigatorHost_requestNavigate_name:
        var params = NavigatorHostRequestNavigateParams.deserialize(
            message.payload);
        _delegate.requestNavigate(params.target, params.request);
        break;
      case kNavigatorHost_didNavigateLocally_name:
        var params = NavigatorHostDidNavigateLocallyParams.deserialize(
            message.payload);
        _delegate.didNavigateLocally(params.url);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  NavigatorHost get delegate => _delegate;
      set delegate(NavigatorHost d) {
    assert(_delegate == null);
    _delegate = d;
  }
}




