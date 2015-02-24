// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library web_socket.mojom;

import 'dart:async';
import 'dart:mojo_bindings' as bindings;
import 'dart:mojo_core' as core;
import 'package:mojo/services/network/public/interfaces/network_error.mojom.dart' as network_error_mojom;


class WebSocketConnectParams extends bindings.Struct {
  static const int kStructSize = 40;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 5);
  String url = null;
  List<String> protocols = null;
  String origin = null;
  core.MojoDataPipeConsumer sendStream = null;
  Object client = null;

  WebSocketConnectParams() : super(kStructSize);

  static WebSocketConnectParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static WebSocketConnectParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    WebSocketConnectParams result = new WebSocketConnectParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 5)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.url = decoder0.decodeString(8, false);
    }
    {
      
      var decoder1 = decoder0.decodePointer(16, false);
      {
        var si1 = decoder1.decodeDataHeaderForPointerArray(bindings.kUnspecifiedArrayLength);
        result.protocols = new List<String>(si1.numElements);
        for (int i1 = 0; i1 < si1.numElements; ++i1) {
          
          result.protocols[i1] = decoder1.decodeString(bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i1, false);
        }
      }
    }
    {
      
      result.origin = decoder0.decodeString(24, false);
    }
    {
      
      result.sendStream = decoder0.decodeConsumerHandle(32, false);
    }
    {
      
      result.client = decoder0.decodeServiceInterface(36, false, WebSocketClientProxy.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeString(url, 8, false);
    
    if (protocols == null) {
      encoder0.encodeNullPointer(16, false);
    } else {
      var encoder1 = encoder0.encodePointerArray(protocols.length, 16, bindings.kUnspecifiedArrayLength);
      for (int i0 = 0; i0 < protocols.length; ++i0) {
        
        encoder1.encodeString(protocols[i0], bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i0, false);
      }
    }
    
    encoder0.encodeString(origin, 24, false);
    
    encoder0.encodeConsumerHandle(sendStream, 32, false);
    
    encoder0.encodeInterface(client, 36, false);
  }
}

class WebSocketSendParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 3);
  bool fin = false;
  int type = 0;
  int numBytes = 0;

  WebSocketSendParams() : super(kStructSize);

  static WebSocketSendParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static WebSocketSendParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    WebSocketSendParams result = new WebSocketSendParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 3)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.fin = decoder0.decodeBool(8, 0);
    }
    {
      
      result.type = decoder0.decodeInt32(12);
    }
    {
      
      result.numBytes = decoder0.decodeUint32(16);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeBool(fin, 8, 0);
    
    encoder0.encodeInt32(type, 12);
    
    encoder0.encodeUint32(numBytes, 16);
  }
}

class WebSocketFlowControlParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  int quota = 0;

  WebSocketFlowControlParams() : super(kStructSize);

  static WebSocketFlowControlParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static WebSocketFlowControlParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    WebSocketFlowControlParams result = new WebSocketFlowControlParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.quota = decoder0.decodeInt64(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInt64(quota, 8);
  }
}

class WebSocketCloseParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
  int code = 0;
  String reason = null;

  WebSocketCloseParams() : super(kStructSize);

  static WebSocketCloseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static WebSocketCloseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    WebSocketCloseParams result = new WebSocketCloseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 2)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.code = decoder0.decodeUint16(8);
    }
    {
      
      result.reason = decoder0.decodeString(16, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint16(code, 8);
    
    encoder0.encodeString(reason, 16, false);
  }
}

class WebSocketClientDidConnectParams extends bindings.Struct {
  static const int kStructSize = 32;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 4);
  bool fail = false;
  core.MojoDataPipeConsumer receiveStream = null;
  String selectedSubprotocol = null;
  String extensions = null;

  WebSocketClientDidConnectParams() : super(kStructSize);

  static WebSocketClientDidConnectParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static WebSocketClientDidConnectParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    WebSocketClientDidConnectParams result = new WebSocketClientDidConnectParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 4)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.fail = decoder0.decodeBool(8, 0);
    }
    {
      
      result.receiveStream = decoder0.decodeConsumerHandle(12, false);
    }
    {
      
      result.selectedSubprotocol = decoder0.decodeString(16, false);
    }
    {
      
      result.extensions = decoder0.decodeString(24, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeBool(fail, 8, 0);
    
    encoder0.encodeConsumerHandle(receiveStream, 12, false);
    
    encoder0.encodeString(selectedSubprotocol, 16, false);
    
    encoder0.encodeString(extensions, 24, false);
  }
}

class WebSocketClientDidReceiveDataParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 3);
  bool fin = false;
  int type = 0;
  int numBytes = 0;

  WebSocketClientDidReceiveDataParams() : super(kStructSize);

  static WebSocketClientDidReceiveDataParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static WebSocketClientDidReceiveDataParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    WebSocketClientDidReceiveDataParams result = new WebSocketClientDidReceiveDataParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 3)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.fin = decoder0.decodeBool(8, 0);
    }
    {
      
      result.type = decoder0.decodeInt32(12);
    }
    {
      
      result.numBytes = decoder0.decodeUint32(16);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeBool(fin, 8, 0);
    
    encoder0.encodeInt32(type, 12);
    
    encoder0.encodeUint32(numBytes, 16);
  }
}

class WebSocketClientDidReceiveFlowControlParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  int quota = 0;

  WebSocketClientDidReceiveFlowControlParams() : super(kStructSize);

  static WebSocketClientDidReceiveFlowControlParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static WebSocketClientDidReceiveFlowControlParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    WebSocketClientDidReceiveFlowControlParams result = new WebSocketClientDidReceiveFlowControlParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.quota = decoder0.decodeInt64(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInt64(quota, 8);
  }
}

class WebSocketClientDidFailParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  String message = null;

  WebSocketClientDidFailParams() : super(kStructSize);

  static WebSocketClientDidFailParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static WebSocketClientDidFailParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    WebSocketClientDidFailParams result = new WebSocketClientDidFailParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.message = decoder0.decodeString(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeString(message, 8, false);
  }
}

class WebSocketClientDidCloseParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 3);
  bool wasClean = false;
  int code = 0;
  String reason = null;

  WebSocketClientDidCloseParams() : super(kStructSize);

  static WebSocketClientDidCloseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static WebSocketClientDidCloseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    WebSocketClientDidCloseParams result = new WebSocketClientDidCloseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 3)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.wasClean = decoder0.decodeBool(8, 0);
    }
    {
      
      result.code = decoder0.decodeUint16(10);
    }
    {
      
      result.reason = decoder0.decodeString(16, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeBool(wasClean, 8, 0);
    
    encoder0.encodeUint16(code, 10);
    
    encoder0.encodeString(reason, 16, false);
  }
}
const int kWebSocket_connect_name = 0;
const int kWebSocket_send_name = 1;
const int kWebSocket_flowControl_name = 2;
const int kWebSocket_close_name = 3;

abstract class WebSocket implements core.Listener {
  static const String name = 'mojo::WebSocket';
  WebSocketStub stub;

  WebSocket(core.MojoMessagePipeEndpoint endpoint) :
      stub = new WebSocketStub(endpoint);

  WebSocket.fromHandle(core.MojoHandle handle) :
      stub = new WebSocketStub.fromHandle(handle);

  WebSocket.fromStub(this.stub);

  WebSocket.unbound() :
      stub = new WebSocketStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  WebSocket get delegate => stub.delegate;
  set delegate(WebSocket d) {
    stub.delegate = d;
  }
  void connect(String url, List<String> protocols, String origin, core.MojoDataPipeConsumer sendStream, Object client);
  void send(bool fin, int type, int numBytes);
  void flowControl(int quota);
  void close(int code, String reason);

  static final ABNORMAL_CLOSE_CODE = 1006;
  
  static final int MessageType_CONTINUATION = 0;
  static final int MessageType_TEXT = MessageType_CONTINUATION + 1;
  static final int MessageType_BINARY = MessageType_TEXT + 1;
}

class WebSocketProxy extends bindings.Proxy implements WebSocket {
  WebSocketProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  WebSocketProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  WebSocketProxy.unbound() : super.unbound();

  String get name => WebSocket.name;

  static WebSocketProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new WebSocketProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
  void connect(String url, List<String> protocols, String origin, core.MojoDataPipeConsumer sendStream, Object client) {
    var params = new WebSocketConnectParams();
    params.url = url;
    params.protocols = protocols;
    params.origin = origin;
    params.sendStream = sendStream;
    params.client = client;
    sendMessage(params, kWebSocket_connect_name);
  }

  void send(bool fin, int type, int numBytes) {
    var params = new WebSocketSendParams();
    params.fin = fin;
    params.type = type;
    params.numBytes = numBytes;
    sendMessage(params, kWebSocket_send_name);
  }

  void flowControl(int quota) {
    var params = new WebSocketFlowControlParams();
    params.quota = quota;
    sendMessage(params, kWebSocket_flowControl_name);
  }

  void close(int code, String reason) {
    var params = new WebSocketCloseParams();
    params.code = code;
    params.reason = reason;
    sendMessage(params, kWebSocket_close_name);
  }

}

class WebSocketStub extends bindings.Stub {
  WebSocket _delegate = null;

  WebSocketStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  WebSocketStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  WebSocketStub.unbound() : super.unbound();

  static WebSocketStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new WebSocketStub(endpoint);

  static const String name = WebSocket.name;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kWebSocket_connect_name:
        var params = WebSocketConnectParams.deserialize(
            message.payload);
        _delegate.connect(params.url, params.protocols, params.origin, params.sendStream, params.client);
        break;
      case kWebSocket_send_name:
        var params = WebSocketSendParams.deserialize(
            message.payload);
        _delegate.send(params.fin, params.type, params.numBytes);
        break;
      case kWebSocket_flowControl_name:
        var params = WebSocketFlowControlParams.deserialize(
            message.payload);
        _delegate.flowControl(params.quota);
        break;
      case kWebSocket_close_name:
        var params = WebSocketCloseParams.deserialize(
            message.payload);
        _delegate.close(params.code, params.reason);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  WebSocket get delegate => _delegate;
      set delegate(WebSocket d) {
    assert(_delegate == null);
    _delegate = d;
  }
}



const int kWebSocketClient_didConnect_name = 0;
const int kWebSocketClient_didReceiveData_name = 1;
const int kWebSocketClient_didReceiveFlowControl_name = 2;
const int kWebSocketClient_didFail_name = 3;
const int kWebSocketClient_didClose_name = 4;

abstract class WebSocketClient implements core.Listener {
  static const String name = 'mojo::WebSocketClient';
  WebSocketClientStub stub;

  WebSocketClient(core.MojoMessagePipeEndpoint endpoint) :
      stub = new WebSocketClientStub(endpoint);

  WebSocketClient.fromHandle(core.MojoHandle handle) :
      stub = new WebSocketClientStub.fromHandle(handle);

  WebSocketClient.fromStub(this.stub);

  WebSocketClient.unbound() :
      stub = new WebSocketClientStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  WebSocketClient get delegate => stub.delegate;
  set delegate(WebSocketClient d) {
    stub.delegate = d;
  }
  void didConnect(bool fail, String selectedSubprotocol, String extensions, core.MojoDataPipeConsumer receiveStream);
  void didReceiveData(bool fin, int type, int numBytes);
  void didReceiveFlowControl(int quota);
  void didFail(String message);
  void didClose(bool wasClean, int code, String reason);

}

class WebSocketClientProxy extends bindings.Proxy implements WebSocketClient {
  WebSocketClientProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  WebSocketClientProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  WebSocketClientProxy.unbound() : super.unbound();

  String get name => WebSocketClient.name;

  static WebSocketClientProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new WebSocketClientProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
  void didConnect(bool fail, String selectedSubprotocol, String extensions, core.MojoDataPipeConsumer receiveStream) {
    var params = new WebSocketClientDidConnectParams();
    params.fail = fail;
    params.selectedSubprotocol = selectedSubprotocol;
    params.extensions = extensions;
    params.receiveStream = receiveStream;
    sendMessage(params, kWebSocketClient_didConnect_name);
  }

  void didReceiveData(bool fin, int type, int numBytes) {
    var params = new WebSocketClientDidReceiveDataParams();
    params.fin = fin;
    params.type = type;
    params.numBytes = numBytes;
    sendMessage(params, kWebSocketClient_didReceiveData_name);
  }

  void didReceiveFlowControl(int quota) {
    var params = new WebSocketClientDidReceiveFlowControlParams();
    params.quota = quota;
    sendMessage(params, kWebSocketClient_didReceiveFlowControl_name);
  }

  void didFail(String message) {
    var params = new WebSocketClientDidFailParams();
    params.message = message;
    sendMessage(params, kWebSocketClient_didFail_name);
  }

  void didClose(bool wasClean, int code, String reason) {
    var params = new WebSocketClientDidCloseParams();
    params.wasClean = wasClean;
    params.code = code;
    params.reason = reason;
    sendMessage(params, kWebSocketClient_didClose_name);
  }

}

class WebSocketClientStub extends bindings.Stub {
  WebSocketClient _delegate = null;

  WebSocketClientStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  WebSocketClientStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  WebSocketClientStub.unbound() : super.unbound();

  static WebSocketClientStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new WebSocketClientStub(endpoint);

  static const String name = WebSocketClient.name;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kWebSocketClient_didConnect_name:
        var params = WebSocketClientDidConnectParams.deserialize(
            message.payload);
        _delegate.didConnect(params.fail, params.selectedSubprotocol, params.extensions, params.receiveStream);
        break;
      case kWebSocketClient_didReceiveData_name:
        var params = WebSocketClientDidReceiveDataParams.deserialize(
            message.payload);
        _delegate.didReceiveData(params.fin, params.type, params.numBytes);
        break;
      case kWebSocketClient_didReceiveFlowControl_name:
        var params = WebSocketClientDidReceiveFlowControlParams.deserialize(
            message.payload);
        _delegate.didReceiveFlowControl(params.quota);
        break;
      case kWebSocketClient_didFail_name:
        var params = WebSocketClientDidFailParams.deserialize(
            message.payload);
        _delegate.didFail(params.message);
        break;
      case kWebSocketClient_didClose_name:
        var params = WebSocketClientDidCloseParams.deserialize(
            message.payload);
        _delegate.didClose(params.wasClean, params.code, params.reason);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  WebSocketClient get delegate => _delegate;
      set delegate(WebSocketClient d) {
    assert(_delegate == null);
    _delegate = d;
  }
}




