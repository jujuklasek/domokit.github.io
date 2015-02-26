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

abstract class Keyboard implements core.Listener {
  static const String name = 'mojo::Keyboard';
  KeyboardStub stub;

  Keyboard(core.MojoMessagePipeEndpoint endpoint) :
      stub = new KeyboardStub(endpoint);

  Keyboard.fromHandle(core.MojoHandle handle) :
      stub = new KeyboardStub.fromHandle(handle);

  Keyboard.fromStub(this.stub);

  Keyboard.unbound() :
      stub = new KeyboardStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen({Function onClosed}) =>
      stub.listen(onClosed: onClosed);

  Keyboard get delegate => stub.delegate;
  set delegate(Keyboard d) {
    stub.delegate = d;
  }
  void show();
  void hide();

}

class KeyboardProxy extends bindings.Proxy implements Keyboard {
  KeyboardProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  KeyboardProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  KeyboardProxy.unbound() : super.unbound();

  String get name => Keyboard.name;

  static KeyboardProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new KeyboardProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
  void show() {
    var params = new KeyboardShowParams();
    sendMessage(params, kKeyboard_show_name);
  }

  void hide() {
    var params = new KeyboardHideParams();
    sendMessage(params, kKeyboard_hide_name);
  }

}

class KeyboardStub extends bindings.Stub {
  Keyboard _delegate = null;

  KeyboardStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  KeyboardStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  KeyboardStub.unbound() : super.unbound();

  static KeyboardStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new KeyboardStub(endpoint);

  static const String name = Keyboard.name;



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


