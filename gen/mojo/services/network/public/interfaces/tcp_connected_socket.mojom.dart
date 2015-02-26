// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library tcp_connected_socket.mojom;

import 'dart:async';
import 'mojo:bindings' as bindings;
import 'mojo:core' as core;


abstract class TcpConnectedSocket implements core.Listener {
  static const String name = 'mojo::TcpConnectedSocket';
  TcpConnectedSocketStub stub;

  TcpConnectedSocket(core.MojoMessagePipeEndpoint endpoint) :
      stub = new TcpConnectedSocketStub(endpoint);

  TcpConnectedSocket.fromHandle(core.MojoHandle handle) :
      stub = new TcpConnectedSocketStub.fromHandle(handle);

  TcpConnectedSocket.fromStub(this.stub);

  TcpConnectedSocket.unbound() :
      stub = new TcpConnectedSocketStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  TcpConnectedSocket get delegate => stub.delegate;
  set delegate(TcpConnectedSocket d) {
    stub.delegate = d;
  }

}

class TcpConnectedSocketProxy extends bindings.Proxy implements TcpConnectedSocket {
  TcpConnectedSocketProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  TcpConnectedSocketProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  TcpConnectedSocketProxy.unbound() : super.unbound();

  String get name => TcpConnectedSocket.name;

  static TcpConnectedSocketProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TcpConnectedSocketProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
}

class TcpConnectedSocketStub extends bindings.Stub {
  TcpConnectedSocket _delegate = null;

  TcpConnectedSocketStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  TcpConnectedSocketStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  TcpConnectedSocketStub.unbound() : super.unbound();

  static TcpConnectedSocketStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TcpConnectedSocketStub(endpoint);

  static const String name = TcpConnectedSocket.name;



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




