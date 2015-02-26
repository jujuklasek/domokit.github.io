// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library tcp_bound_socket.mojom;

import 'dart:async';
import 'mojo:bindings' as bindings;
import 'mojo:core' as core;
import 'package:mojo/services/network/public/interfaces/net_address.mojom.dart' as net_address_mojom;
import 'package:mojo/services/network/public/interfaces/network_error.mojom.dart' as network_error_mojom;
import 'package:mojo/services/network/public/interfaces/tcp_connected_socket.mojom.dart' as tcp_connected_socket_mojom;
import 'package:mojo/services/network/public/interfaces/tcp_server_socket.mojom.dart' as tcp_server_socket_mojom;


class TcpBoundSocketStartListeningParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  Object server = null;

  TcpBoundSocketStartListeningParams() : super(kStructSize);

  static TcpBoundSocketStartListeningParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TcpBoundSocketStartListeningParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TcpBoundSocketStartListeningParams result = new TcpBoundSocketStartListeningParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.server = decoder0.decodeInterfaceRequest(8, false, tcp_server_socket_mojom.TcpServerSocketStub.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInterfaceRequest(server, 8, false);
  }
}

class TcpBoundSocketStartListeningResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  network_error_mojom.NetworkError result = null;

  TcpBoundSocketStartListeningResponseParams() : super(kStructSize);

  static TcpBoundSocketStartListeningResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TcpBoundSocketStartListeningResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TcpBoundSocketStartListeningResponseParams result = new TcpBoundSocketStartListeningResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.result = network_error_mojom.NetworkError.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(result, 8, false);
  }
}

class TcpBoundSocketConnectParams extends bindings.Struct {
  static const int kStructSize = 32;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 4);
  net_address_mojom.NetAddress remoteAddress = null;
  core.MojoDataPipeConsumer sendStream = null;
  core.MojoDataPipeProducer receiveStream = null;
  Object clientSocket = null;

  TcpBoundSocketConnectParams() : super(kStructSize);

  static TcpBoundSocketConnectParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TcpBoundSocketConnectParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TcpBoundSocketConnectParams result = new TcpBoundSocketConnectParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 4)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.remoteAddress = net_address_mojom.NetAddress.decode(decoder1);
    }
    {
      
      result.sendStream = decoder0.decodeConsumerHandle(16, false);
    }
    {
      
      result.receiveStream = decoder0.decodeProducerHandle(20, false);
    }
    {
      
      result.clientSocket = decoder0.decodeInterfaceRequest(24, false, tcp_connected_socket_mojom.TcpConnectedSocketStub.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(remoteAddress, 8, false);
    
    encoder0.encodeConsumerHandle(sendStream, 16, false);
    
    encoder0.encodeProducerHandle(receiveStream, 20, false);
    
    encoder0.encodeInterfaceRequest(clientSocket, 24, false);
  }
}

class TcpBoundSocketConnectResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  network_error_mojom.NetworkError result = null;

  TcpBoundSocketConnectResponseParams() : super(kStructSize);

  static TcpBoundSocketConnectResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TcpBoundSocketConnectResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TcpBoundSocketConnectResponseParams result = new TcpBoundSocketConnectResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.result = network_error_mojom.NetworkError.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(result, 8, false);
  }
}
const int kTcpBoundSocket_startListening_name = 0;
const int kTcpBoundSocket_connect_name = 1;

abstract class TcpBoundSocket implements core.Listener {
  static const String name = 'mojo::TcpBoundSocket';
  TcpBoundSocketStub stub;

  TcpBoundSocket(core.MojoMessagePipeEndpoint endpoint) :
      stub = new TcpBoundSocketStub(endpoint);

  TcpBoundSocket.fromHandle(core.MojoHandle handle) :
      stub = new TcpBoundSocketStub.fromHandle(handle);

  TcpBoundSocket.fromStub(this.stub);

  TcpBoundSocket.unbound() :
      stub = new TcpBoundSocketStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen({Function onClosed}) =>
      stub.listen(onClosed: onClosed);

  TcpBoundSocket get delegate => stub.delegate;
  set delegate(TcpBoundSocket d) {
    stub.delegate = d;
  }
  Future<TcpBoundSocketStartListeningResponseParams> startListening(Object server,[Function responseFactory = null]);
  Future<TcpBoundSocketConnectResponseParams> connect(net_address_mojom.NetAddress remoteAddress,core.MojoDataPipeConsumer sendStream,core.MojoDataPipeProducer receiveStream,Object clientSocket,[Function responseFactory = null]);

}

class TcpBoundSocketProxy extends bindings.Proxy implements TcpBoundSocket {
  TcpBoundSocketProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  TcpBoundSocketProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  TcpBoundSocketProxy.unbound() : super.unbound();

  String get name => TcpBoundSocket.name;

  static TcpBoundSocketProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TcpBoundSocketProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kTcpBoundSocket_startListening_name:
        var r = TcpBoundSocketStartListeningResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      case kTcpBoundSocket_connect_name:
        var r = TcpBoundSocketConnectResponseParams.deserialize(
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
  Future<TcpBoundSocketStartListeningResponseParams> startListening(Object server,[Function responseFactory = null]) {
    var params = new TcpBoundSocketStartListeningParams();
    params.server = server;
    return sendMessageWithRequestId(
        params,
        kTcpBoundSocket_startListening_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  Future<TcpBoundSocketConnectResponseParams> connect(net_address_mojom.NetAddress remoteAddress,core.MojoDataPipeConsumer sendStream,core.MojoDataPipeProducer receiveStream,Object clientSocket,[Function responseFactory = null]) {
    var params = new TcpBoundSocketConnectParams();
    params.remoteAddress = remoteAddress;
    params.sendStream = sendStream;
    params.receiveStream = receiveStream;
    params.clientSocket = clientSocket;
    return sendMessageWithRequestId(
        params,
        kTcpBoundSocket_connect_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
}

class TcpBoundSocketStub extends bindings.Stub {
  TcpBoundSocket _delegate = null;

  TcpBoundSocketStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  TcpBoundSocketStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  TcpBoundSocketStub.unbound() : super.unbound();

  static TcpBoundSocketStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TcpBoundSocketStub(endpoint);

  static const String name = TcpBoundSocket.name;


  TcpBoundSocketStartListeningResponseParams _TcpBoundSocketStartListeningResponseParamsFactory(network_error_mojom.NetworkError result) {
    var result = new TcpBoundSocketStartListeningResponseParams();
    result.result = result;
    return result;
  }
  TcpBoundSocketConnectResponseParams _TcpBoundSocketConnectResponseParamsFactory(network_error_mojom.NetworkError result) {
    var result = new TcpBoundSocketConnectResponseParams();
    result.result = result;
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kTcpBoundSocket_startListening_name:
        var params = TcpBoundSocketStartListeningParams.deserialize(
            message.payload);
        return _delegate.startListening(params.server,_TcpBoundSocketStartListeningResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kTcpBoundSocket_startListening_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kTcpBoundSocket_connect_name:
        var params = TcpBoundSocketConnectParams.deserialize(
            message.payload);
        return _delegate.connect(params.remoteAddress,params.sendStream,params.receiveStream,params.clientSocket,_TcpBoundSocketConnectResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kTcpBoundSocket_connect_name,
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

  TcpBoundSocket get delegate => _delegate;
      set delegate(TcpBoundSocket d) {
    assert(_delegate == null);
    _delegate = d;
  }
}


