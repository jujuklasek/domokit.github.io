// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library navigation.mojom;

import 'dart:async';
import 'mojo:bindings' as bindings;
import 'mojo:core' as core;
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

class NavigatorHostRequestNavigateHistoryParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  int delta = 0;

  NavigatorHostRequestNavigateHistoryParams() : super(kStructSize);

  static NavigatorHostRequestNavigateHistoryParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static NavigatorHostRequestNavigateHistoryParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    NavigatorHostRequestNavigateHistoryParams result = new NavigatorHostRequestNavigateHistoryParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.delta = decoder0.decodeInt32(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInt32(delta, 8);
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
const int kNavigatorHost_requestNavigateHistory_name = 1;
const int kNavigatorHost_didNavigateLocally_name = 2;

const String NavigatorHostName =
      'mojo::NavigatorHost';

abstract class NavigatorHost {
  void requestNavigate(int target, url_loader_mojom.UrlRequest request);
  void requestNavigateHistory(int delta);
  void didNavigateLocally(String url);

}


class NavigatorHostProxyImpl extends bindings.Proxy {
  NavigatorHostProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  NavigatorHostProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  NavigatorHostProxyImpl.unbound() : super.unbound();

  static NavigatorHostProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new NavigatorHostProxyImpl.fromEndpoint(endpoint);

  String get name => NavigatorHostName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
}


class _NavigatorHostProxyCalls implements NavigatorHost {
  NavigatorHostProxyImpl _proxyImpl;

  _NavigatorHostProxyCalls(this._proxyImpl);
    void requestNavigate(int target, url_loader_mojom.UrlRequest request) {
      var params = new NavigatorHostRequestNavigateParams();
      params.target = target;
      params.request = request;
      _proxyImpl.sendMessage(params, kNavigatorHost_requestNavigate_name);
    }
  
    void requestNavigateHistory(int delta) {
      var params = new NavigatorHostRequestNavigateHistoryParams();
      params.delta = delta;
      _proxyImpl.sendMessage(params, kNavigatorHost_requestNavigateHistory_name);
    }
  
    void didNavigateLocally(String url) {
      var params = new NavigatorHostDidNavigateLocallyParams();
      params.url = url;
      _proxyImpl.sendMessage(params, kNavigatorHost_didNavigateLocally_name);
    }
  
}


class NavigatorHostProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  NavigatorHost ptr;
  final String name = NavigatorHostName;

  NavigatorHostProxy(NavigatorHostProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _NavigatorHostProxyCalls(proxyImpl);

  NavigatorHostProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new NavigatorHostProxyImpl.fromEndpoint(endpoint) {
    ptr = new _NavigatorHostProxyCalls(impl);
  }

  NavigatorHostProxy.fromHandle(core.MojoHandle handle) :
      impl = new NavigatorHostProxyImpl.fromHandle(handle) {
    ptr = new _NavigatorHostProxyCalls(impl);
  }

  NavigatorHostProxy.unbound() :
      impl = new NavigatorHostProxyImpl.unbound() {
    ptr = new _NavigatorHostProxyCalls(impl);
  }

  static NavigatorHostProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new NavigatorHostProxy.fromEndpoint(endpoint);

  void close() => impl.close();
}


class NavigatorHostStub extends bindings.Stub {
  NavigatorHost _delegate = null;

  NavigatorHostStub.fromEndpoint(core.MojoMessagePipeEndpoint endpoint) :
      super(endpoint);

  NavigatorHostStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  NavigatorHostStub.unbound() : super.unbound();

  static NavigatorHostStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new NavigatorHostStub.fromEndpoint(endpoint);

  static const String name = NavigatorHostName;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kNavigatorHost_requestNavigate_name:
        var params = NavigatorHostRequestNavigateParams.deserialize(
            message.payload);
        _delegate.requestNavigate(params.target, params.request);
        break;
      case kNavigatorHost_requestNavigateHistory_name:
        var params = NavigatorHostRequestNavigateHistoryParams.deserialize(
            message.payload);
        _delegate.requestNavigateHistory(params.delta);
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


