// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library browser_host.mojom;

import 'dart:async';
import 'dart:mojo_bindings' as bindings;
import 'dart:mojo_core' as core;


class BrowserHostNavigateToParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  String url = null;

  BrowserHostNavigateToParams() : super(kStructSize);

  static BrowserHostNavigateToParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static BrowserHostNavigateToParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    BrowserHostNavigateToParams result = new BrowserHostNavigateToParams();

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
const int kBrowserHost_navigateTo_name = 0;

abstract class BrowserHost implements core.Listener {
  static const String name = 'mojo::examples::BrowserHost';
  BrowserHostStub stub;

  BrowserHost(core.MojoMessagePipeEndpoint endpoint) :
      stub = new BrowserHostStub(endpoint);

  BrowserHost.fromHandle(core.MojoHandle handle) :
      stub = new BrowserHostStub.fromHandle(handle);

  BrowserHost.fromStub(this.stub);

  BrowserHost.unbound() :
      stub = new BrowserHostStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  BrowserHost get delegate => stub.delegate;
  set delegate(BrowserHost d) {
    stub.delegate = d;
  }
  void navigateTo(String url);

}

class BrowserHostProxy extends bindings.Proxy implements BrowserHost {
  BrowserHostProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  BrowserHostProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  BrowserHostProxy.unbound() : super.unbound();

  String get name => BrowserHost.name;

  static BrowserHostProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new BrowserHostProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
  void navigateTo(String url) {
    var params = new BrowserHostNavigateToParams();
    params.url = url;
    sendMessage(params, kBrowserHost_navigateTo_name);
  }

}

class BrowserHostStub extends bindings.Stub {
  BrowserHost _delegate = null;

  BrowserHostStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  BrowserHostStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  BrowserHostStub.unbound() : super.unbound();

  static BrowserHostStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new BrowserHostStub(endpoint);

  static const String name = BrowserHost.name;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kBrowserHost_navigateTo_name:
        var params = BrowserHostNavigateToParams.deserialize(
            message.payload);
        _delegate.navigateTo(params.url);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  BrowserHost get delegate => _delegate;
      set delegate(BrowserHost d) {
    assert(_delegate == null);
    _delegate = d;
  }
}




