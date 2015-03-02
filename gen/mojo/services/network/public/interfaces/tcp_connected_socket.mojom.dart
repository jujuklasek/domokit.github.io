// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library tcp_connected_socket.mojom;

import 'dart:async';
import 'mojo:bindings' as bindings;
import 'mojo:core' as core;


const String TcpConnectedSocketName =
      'mojo::TcpConnectedSocket';

abstract class TcpConnectedSocket {

}


class TcpConnectedSocketProxyImpl extends bindings.Proxy {
  TcpConnectedSocketProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  TcpConnectedSocketProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  TcpConnectedSocketProxyImpl.unbound() : super.unbound();

  static TcpConnectedSocketProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TcpConnectedSocketProxyImpl.fromEndpoint(endpoint);

  String get name => TcpConnectedSocketName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
}


class _TcpConnectedSocketProxyCalls implements TcpConnectedSocket {
  TcpConnectedSocketProxyImpl _proxyImpl;

  _TcpConnectedSocketProxyCalls(this._proxyImpl);
}


class TcpConnectedSocketProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  TcpConnectedSocket ptr;
  final String name = TcpConnectedSocketName;

  TcpConnectedSocketProxy(TcpConnectedSocketProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _TcpConnectedSocketProxyCalls(proxyImpl);

  TcpConnectedSocketProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new TcpConnectedSocketProxyImpl.fromEndpoint(endpoint) {
    ptr = new _TcpConnectedSocketProxyCalls(impl);
  }

  TcpConnectedSocketProxy.fromHandle(core.MojoHandle handle) :
      impl = new TcpConnectedSocketProxyImpl.fromHandle(handle) {
    ptr = new _TcpConnectedSocketProxyCalls(impl);
  }

  TcpConnectedSocketProxy.unbound() :
      impl = new TcpConnectedSocketProxyImpl.unbound() {
    ptr = new _TcpConnectedSocketProxyCalls(impl);
  }

  static TcpConnectedSocketProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TcpConnectedSocketProxy.fromEndpoint(endpoint);

  void close() => impl.close();
}


class TcpConnectedSocketStub extends bindings.Stub {
  TcpConnectedSocket _delegate = null;

  TcpConnectedSocketStub.fromEndpoint(core.MojoMessagePipeEndpoint endpoint) :
      super(endpoint);

  TcpConnectedSocketStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  TcpConnectedSocketStub.unbound() : super.unbound();

  static TcpConnectedSocketStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TcpConnectedSocketStub.fromEndpoint(endpoint);

  static const String name = TcpConnectedSocketName;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  TcpConnectedSocket get delegate => _delegate;
      set delegate(TcpConnectedSocket d) {
    assert(_delegate == null);
    _delegate = d;
  }
}


