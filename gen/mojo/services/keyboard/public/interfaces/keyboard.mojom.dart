// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library keyboard.mojom;

import 'dart:async';
import 'mojo:bindings' as bindings;
import 'mojo:core' as core;


class KeyboardShowParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  KeyboardShowParams() : super(kStructSize);

  static KeyboardShowParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static KeyboardShowParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    KeyboardShowParams result = new KeyboardShowParams();

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

class KeyboardHideParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  KeyboardHideParams() : super(kStructSize);

  static KeyboardHideParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static KeyboardHideParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    KeyboardHideParams result = new KeyboardHideParams();

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
const int kKeyboard_show_name = 0;
const int kKeyboard_hide_name = 1;

const String KeyboardName =
      'mojo::Keyboard';

abstract class Keyboard {
  void show();
  void hide();

}


class KeyboardProxyImpl extends bindings.Proxy {
  KeyboardProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  KeyboardProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  KeyboardProxyImpl.unbound() : super.unbound();

  static KeyboardProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new KeyboardProxyImpl.fromEndpoint(endpoint);

  String get name => KeyboardName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
}


class _KeyboardProxyCalls implements Keyboard {
  KeyboardProxyImpl _proxyImpl;

  _KeyboardProxyCalls(this._proxyImpl);
    void show() {
      var params = new KeyboardShowParams();
      _proxyImpl.sendMessage(params, kKeyboard_show_name);
    }
  
    void hide() {
      var params = new KeyboardHideParams();
      _proxyImpl.sendMessage(params, kKeyboard_hide_name);
    }
  
}


class KeyboardProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  Keyboard ptr;
  final String name = KeyboardName;

  KeyboardProxy(KeyboardProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _KeyboardProxyCalls(proxyImpl);

  KeyboardProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new KeyboardProxyImpl.fromEndpoint(endpoint) {
    ptr = new _KeyboardProxyCalls(impl);
  }

  KeyboardProxy.fromHandle(core.MojoHandle handle) :
      impl = new KeyboardProxyImpl.fromHandle(handle) {
    ptr = new _KeyboardProxyCalls(impl);
  }

  KeyboardProxy.unbound() :
      impl = new KeyboardProxyImpl.unbound() {
    ptr = new _KeyboardProxyCalls(impl);
  }

  static KeyboardProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new KeyboardProxy.fromEndpoint(endpoint);

  void close() => impl.close();
}


class KeyboardStub extends bindings.Stub {
  Keyboard _delegate = null;

  KeyboardStub.fromEndpoint(core.MojoMessagePipeEndpoint endpoint) :
      super(endpoint);

  KeyboardStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  KeyboardStub.unbound() : super.unbound();

  static KeyboardStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new KeyboardStub.fromEndpoint(endpoint);

  static const String name = KeyboardName;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kKeyboard_show_name:
        var params = KeyboardShowParams.deserialize(
            message.payload);
        _delegate.show();
        break;
      case kKeyboard_hide_name:
        var params = KeyboardHideParams.deserialize(
            message.payload);
        _delegate.hide();
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  Keyboard get delegate => _delegate;
      set delegate(Keyboard d) {
    assert(_delegate == null);
    _delegate = d;
  }
}


