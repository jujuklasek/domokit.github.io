// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library tcp_server_socket.mojom;

import 'dart:async';
import 'mojo:bindings' as bindings;
import 'mojo:core' as core;
import 'package:mojo/services/network/public/interfaces/net_address.mojom.dart' as net_address_mojom;
import 'package:mojo/services/network/public/interfaces/network_error.mojom.dart' as network_error_mojom;
import 'package:mojo/services/network/public/interfaces/tcp_connected_socket.mojom.dart' as tcp_connected_socket_mojom;


class TcpServerSocketAcceptParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 3);
  core.MojoDataPipeConsumer sendStream = null;
  core.MojoDataPipeProducer receiveStream = null;
  Object clientSocket = null;

  TcpServerSocketAcceptParams() : super(kStructSize);

  static TcpServerSocketAcceptParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TcpServerSocketAcceptParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TcpServerSocketAcceptParams result = new TcpServerSocketAcceptParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 3)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.sendStream = decoder0.decodeConsumerHandle(8, false);
    }
    {
      
      result.receiveStream = decoder0.decodeProducerHandle(12, false);
    }
    {
      
      result.clientSocket = decoder0.decodeInterfaceRequest(16, false, tcp_connected_socket_mojom.TcpConnectedSocketStub.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeConsumerHandle(sendStream, 8, false);
    
    encoder0.encodeProducerHandle(receiveStream, 12, false);
    
    encoder0.encodeInterfaceRequest(clientSocket, 16, false);
  }
}

class TcpServerSocketAcceptResponseParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
  network_error_mojom.NetworkError result = null;
  net_address_mojom.NetAddress remoteAddress = null;

  TcpServerSocketAcceptResponseParams() : super(kStructSize);

  static TcpServerSocketAcceptResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TcpServerSocketAcceptResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TcpServerSocketAcceptResponseParams result = new TcpServerSocketAcceptResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 2)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.result = network_error_mojom.NetworkError.decode(decoder1);
    }
    {
      
      var decoder1 = decoder0.decodePointer(16, true);
      result.remoteAddress = net_address_mojom.NetAddress.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(result, 8, false);
    
    encoder0.encodeStruct(remoteAddress, 16, true);
  }
}
const int kTcpServerSocket_accept_name = 0;

abstract class TcpServerSocket implements core.Listener {
  static const String name = 'mojo::TcpServerSocket';
  TcpServerSocketStub stub;

  TcpServerSocket(core.MojoMessagePipeEndpoint endpoint) :
      stub = new TcpServerSocketStub(endpoint);

  TcpServerSocket.fromHandle(core.MojoHandle handle) :
      stub = new TcpServerSocketStub.fromHandle(handle);

  TcpServerSocket.fromStub(this.stub);

  TcpServerSocket.unbound() :
      stub = new TcpServerSocketStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen({Function onClosed}) =>
      stub.listen(onClosed: onClosed);

  TcpServerSocket get delegate => stub.delegate;
  set delegate(TcpServerSocket d) {
    stub.delegate = d;
  }
  Future<TcpServerSocketAcceptResponseParams> accept(core.MojoDataPipeConsumer sendStream,core.MojoDataPipeProducer receiveStream,Object clientSocket,[Function responseFactory = null]);

}

class TcpServerSocketProxy extends bindings.Proxy implements TcpServerSocket {
  TcpServerSocketProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  TcpServerSocketProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  TcpServerSocketProxy.unbound() : super.unbound();

  String get name => TcpServerSocket.name;

  static TcpServerSocketProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TcpServerSocketProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kTcpServerSocket_accept_name:
        var r = TcpServerSocketAcceptResponseParams.deserialize(
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
  Future<TcpServerSocketAcceptResponseParams> accept(core.MojoDataPipeConsumer sendStream,core.MojoDataPipeProducer receiveStream,Object clientSocket,[Function responseFactory = null]) {
    var params = new TcpServerSocketAcceptParams();
    params.sendStream = sendStream;
    params.receiveStream = receiveStream;
    params.clientSocket = clientSocket;
    return sendMessageWithRequestId(
        params,
        kTcpServerSocket_accept_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
}

class TcpServerSocketStub extends bindings.Stub {
  TcpServerSocket _delegate = null;

  TcpServerSocketStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  TcpServerSocketStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  TcpServerSocketStub.unbound() : super.unbound();

  static TcpServerSocketStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TcpServerSocketStub(endpoint);

  static const String name = TcpServerSocket.name;


  TcpServerSocketAcceptResponseParams _TcpServerSocketAcceptResponseParamsFactory(network_error_mojom.NetworkError result, net_address_mojom.NetAddress remoteAddress) {
    var result = new TcpServerSocketAcceptResponseParams();
    result.result = result;
    result.remoteAddress = remoteAddress;
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kTcpServerSocket_accept_name:
        var params = TcpServerSocketAcceptParams.deserialize(
            message.payload);
        return _delegate.accept(params.sendStream,params.receiveStream,params.clientSocket,_TcpServerSocketAcceptResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kTcpServerSocket_accept_name,
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

  TcpServerSocket get delegate => _delegate;
      set delegate(TcpServerSocket d) {
    assert(_delegate == null);
    _delegate = d;
  }
}


