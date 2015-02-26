// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library udp_socket.mojom;

import 'dart:async';
import 'mojo:bindings' as bindings;
import 'mojo:core' as core;
import 'package:mojo/services/network/public/interfaces/net_address.mojom.dart' as net_address_mojom;
import 'package:mojo/services/network/public/interfaces/network_error.mojom.dart' as network_error_mojom;


class UdpSocketAllowAddressReuseParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  UdpSocketAllowAddressReuseParams() : super(kStructSize);

  static UdpSocketAllowAddressReuseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static UdpSocketAllowAddressReuseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    UdpSocketAllowAddressReuseParams result = new UdpSocketAllowAddressReuseParams();

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

class UdpSocketAllowAddressReuseResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  network_error_mojom.NetworkError result = null;

  UdpSocketAllowAddressReuseResponseParams() : super(kStructSize);

  static UdpSocketAllowAddressReuseResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static UdpSocketAllowAddressReuseResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    UdpSocketAllowAddressReuseResponseParams result = new UdpSocketAllowAddressReuseResponseParams();

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

class UdpSocketBindParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  net_address_mojom.NetAddress addr = null;

  UdpSocketBindParams() : super(kStructSize);

  static UdpSocketBindParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static UdpSocketBindParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    UdpSocketBindParams result = new UdpSocketBindParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.addr = net_address_mojom.NetAddress.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(addr, 8, false);
  }
}

class UdpSocketBindResponseParams extends bindings.Struct {
  static const int kStructSize = 32;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 3);
  network_error_mojom.NetworkError result = null;
  net_address_mojom.NetAddress boundAddr = null;
  Object receiver = null;

  UdpSocketBindResponseParams() : super(kStructSize);

  static UdpSocketBindResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static UdpSocketBindResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    UdpSocketBindResponseParams result = new UdpSocketBindResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 3)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.result = network_error_mojom.NetworkError.decode(decoder1);
    }
    {
      
      var decoder1 = decoder0.decodePointer(16, true);
      result.boundAddr = net_address_mojom.NetAddress.decode(decoder1);
    }
    {
      
      result.receiver = decoder0.decodeInterfaceRequest(24, true, UdpSocketReceiverStub.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(result, 8, false);
    
    encoder0.encodeStruct(boundAddr, 16, true);
    
    encoder0.encodeInterfaceRequest(receiver, 24, true);
  }
}

class UdpSocketConnectParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  net_address_mojom.NetAddress remoteAddr = null;

  UdpSocketConnectParams() : super(kStructSize);

  static UdpSocketConnectParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static UdpSocketConnectParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    UdpSocketConnectParams result = new UdpSocketConnectParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.remoteAddr = net_address_mojom.NetAddress.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(remoteAddr, 8, false);
  }
}

class UdpSocketConnectResponseParams extends bindings.Struct {
  static const int kStructSize = 32;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 3);
  network_error_mojom.NetworkError result = null;
  net_address_mojom.NetAddress localAddr = null;
  Object receiver = null;

  UdpSocketConnectResponseParams() : super(kStructSize);

  static UdpSocketConnectResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static UdpSocketConnectResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    UdpSocketConnectResponseParams result = new UdpSocketConnectResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 3)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.result = network_error_mojom.NetworkError.decode(decoder1);
    }
    {
      
      var decoder1 = decoder0.decodePointer(16, true);
      result.localAddr = net_address_mojom.NetAddress.decode(decoder1);
    }
    {
      
      result.receiver = decoder0.decodeInterfaceRequest(24, true, UdpSocketReceiverStub.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(result, 8, false);
    
    encoder0.encodeStruct(localAddr, 16, true);
    
    encoder0.encodeInterfaceRequest(receiver, 24, true);
  }
}

class UdpSocketSetSendBufferSizeParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  int size = 0;

  UdpSocketSetSendBufferSizeParams() : super(kStructSize);

  static UdpSocketSetSendBufferSizeParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static UdpSocketSetSendBufferSizeParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    UdpSocketSetSendBufferSizeParams result = new UdpSocketSetSendBufferSizeParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.size = decoder0.decodeUint32(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint32(size, 8);
  }
}

class UdpSocketSetSendBufferSizeResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  network_error_mojom.NetworkError result = null;

  UdpSocketSetSendBufferSizeResponseParams() : super(kStructSize);

  static UdpSocketSetSendBufferSizeResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static UdpSocketSetSendBufferSizeResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    UdpSocketSetSendBufferSizeResponseParams result = new UdpSocketSetSendBufferSizeResponseParams();

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

class UdpSocketSetReceiveBufferSizeParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  int size = 0;

  UdpSocketSetReceiveBufferSizeParams() : super(kStructSize);

  static UdpSocketSetReceiveBufferSizeParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static UdpSocketSetReceiveBufferSizeParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    UdpSocketSetReceiveBufferSizeParams result = new UdpSocketSetReceiveBufferSizeParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.size = decoder0.decodeUint32(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint32(size, 8);
  }
}

class UdpSocketSetReceiveBufferSizeResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  network_error_mojom.NetworkError result = null;

  UdpSocketSetReceiveBufferSizeResponseParams() : super(kStructSize);

  static UdpSocketSetReceiveBufferSizeResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static UdpSocketSetReceiveBufferSizeResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    UdpSocketSetReceiveBufferSizeResponseParams result = new UdpSocketSetReceiveBufferSizeResponseParams();

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

class UdpSocketNegotiateMaxPendingSendRequestsParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  int requestedSize = 0;

  UdpSocketNegotiateMaxPendingSendRequestsParams() : super(kStructSize);

  static UdpSocketNegotiateMaxPendingSendRequestsParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static UdpSocketNegotiateMaxPendingSendRequestsParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    UdpSocketNegotiateMaxPendingSendRequestsParams result = new UdpSocketNegotiateMaxPendingSendRequestsParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.requestedSize = decoder0.decodeUint32(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint32(requestedSize, 8);
  }
}

class UdpSocketNegotiateMaxPendingSendRequestsResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  int actualSize = 0;

  UdpSocketNegotiateMaxPendingSendRequestsResponseParams() : super(kStructSize);

  static UdpSocketNegotiateMaxPendingSendRequestsResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static UdpSocketNegotiateMaxPendingSendRequestsResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    UdpSocketNegotiateMaxPendingSendRequestsResponseParams result = new UdpSocketNegotiateMaxPendingSendRequestsResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.actualSize = decoder0.decodeUint32(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint32(actualSize, 8);
  }
}

class UdpSocketReceiveMoreParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  int datagramNumber = 0;

  UdpSocketReceiveMoreParams() : super(kStructSize);

  static UdpSocketReceiveMoreParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static UdpSocketReceiveMoreParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    UdpSocketReceiveMoreParams result = new UdpSocketReceiveMoreParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.datagramNumber = decoder0.decodeUint32(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint32(datagramNumber, 8);
  }
}

class UdpSocketSendToParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
  net_address_mojom.NetAddress destAddr = null;
  List<int> data = null;

  UdpSocketSendToParams() : super(kStructSize);

  static UdpSocketSendToParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static UdpSocketSendToParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    UdpSocketSendToParams result = new UdpSocketSendToParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 2)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, true);
      result.destAddr = net_address_mojom.NetAddress.decode(decoder1);
    }
    {
      
      result.data = decoder0.decodeUint8Array(16, bindings.kNothingNullable, bindings.kUnspecifiedArrayLength);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(destAddr, 8, true);
    
    encoder0.encodeUint8Array(data, 16, bindings.kNothingNullable, bindings.kUnspecifiedArrayLength);
  }
}

class UdpSocketSendToResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  network_error_mojom.NetworkError result = null;

  UdpSocketSendToResponseParams() : super(kStructSize);

  static UdpSocketSendToResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static UdpSocketSendToResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    UdpSocketSendToResponseParams result = new UdpSocketSendToResponseParams();

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

class UdpSocketReceiverOnReceivedParams extends bindings.Struct {
  static const int kStructSize = 32;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 3);
  network_error_mojom.NetworkError result = null;
  net_address_mojom.NetAddress srcAddr = null;
  List<int> data = null;

  UdpSocketReceiverOnReceivedParams() : super(kStructSize);

  static UdpSocketReceiverOnReceivedParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static UdpSocketReceiverOnReceivedParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    UdpSocketReceiverOnReceivedParams result = new UdpSocketReceiverOnReceivedParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 3)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.result = network_error_mojom.NetworkError.decode(decoder1);
    }
    {
      
      var decoder1 = decoder0.decodePointer(16, true);
      result.srcAddr = net_address_mojom.NetAddress.decode(decoder1);
    }
    {
      
      result.data = decoder0.decodeUint8Array(24, bindings.kArrayNullable, bindings.kUnspecifiedArrayLength);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(result, 8, false);
    
    encoder0.encodeStruct(srcAddr, 16, true);
    
    encoder0.encodeUint8Array(data, 24, bindings.kArrayNullable, bindings.kUnspecifiedArrayLength);
  }
}
const int kUdpSocket_allowAddressReuse_name = 0;
const int kUdpSocket_bind_name = 1;
const int kUdpSocket_connect_name = 2;
const int kUdpSocket_setSendBufferSize_name = 3;
const int kUdpSocket_setReceiveBufferSize_name = 4;
const int kUdpSocket_negotiateMaxPendingSendRequests_name = 5;
const int kUdpSocket_receiveMore_name = 6;
const int kUdpSocket_sendTo_name = 7;

abstract class UdpSocket implements core.Listener {
  static const String name = 'mojo::UdpSocket';
  UdpSocketStub stub;

  UdpSocket(core.MojoMessagePipeEndpoint endpoint) :
      stub = new UdpSocketStub(endpoint);

  UdpSocket.fromHandle(core.MojoHandle handle) :
      stub = new UdpSocketStub.fromHandle(handle);

  UdpSocket.fromStub(this.stub);

  UdpSocket.unbound() :
      stub = new UdpSocketStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen({Function onClosed}) =>
      stub.listen(onClosed: onClosed);

  UdpSocket get delegate => stub.delegate;
  set delegate(UdpSocket d) {
    stub.delegate = d;
  }
  Future<UdpSocketAllowAddressReuseResponseParams> allowAddressReuse([Function responseFactory = null]);
  Future<UdpSocketBindResponseParams> bind(net_address_mojom.NetAddress addr,[Function responseFactory = null]);
  Future<UdpSocketConnectResponseParams> connect(net_address_mojom.NetAddress remoteAddr,[Function responseFactory = null]);
  Future<UdpSocketSetSendBufferSizeResponseParams> setSendBufferSize(int size,[Function responseFactory = null]);
  Future<UdpSocketSetReceiveBufferSizeResponseParams> setReceiveBufferSize(int size,[Function responseFactory = null]);
  Future<UdpSocketNegotiateMaxPendingSendRequestsResponseParams> negotiateMaxPendingSendRequests(int requestedSize,[Function responseFactory = null]);
  void receiveMore(int datagramNumber);
  Future<UdpSocketSendToResponseParams> sendTo(net_address_mojom.NetAddress destAddr,List<int> data,[Function responseFactory = null]);

}

class UdpSocketProxy extends bindings.Proxy implements UdpSocket {
  UdpSocketProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  UdpSocketProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  UdpSocketProxy.unbound() : super.unbound();

  String get name => UdpSocket.name;

  static UdpSocketProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new UdpSocketProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kUdpSocket_allowAddressReuse_name:
        var r = UdpSocketAllowAddressReuseResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      case kUdpSocket_bind_name:
        var r = UdpSocketBindResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      case kUdpSocket_connect_name:
        var r = UdpSocketConnectResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      case kUdpSocket_setSendBufferSize_name:
        var r = UdpSocketSetSendBufferSizeResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      case kUdpSocket_setReceiveBufferSize_name:
        var r = UdpSocketSetReceiveBufferSizeResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      case kUdpSocket_negotiateMaxPendingSendRequests_name:
        var r = UdpSocketNegotiateMaxPendingSendRequestsResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      case kUdpSocket_sendTo_name:
        var r = UdpSocketSendToResponseParams.deserialize(
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
  Future<UdpSocketAllowAddressReuseResponseParams> allowAddressReuse([Function responseFactory = null]) {
    var params = new UdpSocketAllowAddressReuseParams();
    return sendMessageWithRequestId(
        params,
        kUdpSocket_allowAddressReuse_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  Future<UdpSocketBindResponseParams> bind(net_address_mojom.NetAddress addr,[Function responseFactory = null]) {
    var params = new UdpSocketBindParams();
    params.addr = addr;
    return sendMessageWithRequestId(
        params,
        kUdpSocket_bind_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  Future<UdpSocketConnectResponseParams> connect(net_address_mojom.NetAddress remoteAddr,[Function responseFactory = null]) {
    var params = new UdpSocketConnectParams();
    params.remoteAddr = remoteAddr;
    return sendMessageWithRequestId(
        params,
        kUdpSocket_connect_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  Future<UdpSocketSetSendBufferSizeResponseParams> setSendBufferSize(int size,[Function responseFactory = null]) {
    var params = new UdpSocketSetSendBufferSizeParams();
    params.size = size;
    return sendMessageWithRequestId(
        params,
        kUdpSocket_setSendBufferSize_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  Future<UdpSocketSetReceiveBufferSizeResponseParams> setReceiveBufferSize(int size,[Function responseFactory = null]) {
    var params = new UdpSocketSetReceiveBufferSizeParams();
    params.size = size;
    return sendMessageWithRequestId(
        params,
        kUdpSocket_setReceiveBufferSize_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  Future<UdpSocketNegotiateMaxPendingSendRequestsResponseParams> negotiateMaxPendingSendRequests(int requestedSize,[Function responseFactory = null]) {
    var params = new UdpSocketNegotiateMaxPendingSendRequestsParams();
    params.requestedSize = requestedSize;
    return sendMessageWithRequestId(
        params,
        kUdpSocket_negotiateMaxPendingSendRequests_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  void receiveMore(int datagramNumber) {
    var params = new UdpSocketReceiveMoreParams();
    params.datagramNumber = datagramNumber;
    sendMessage(params, kUdpSocket_receiveMore_name);
  }

  Future<UdpSocketSendToResponseParams> sendTo(net_address_mojom.NetAddress destAddr,List<int> data,[Function responseFactory = null]) {
    var params = new UdpSocketSendToParams();
    params.destAddr = destAddr;
    params.data = data;
    return sendMessageWithRequestId(
        params,
        kUdpSocket_sendTo_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
}

class UdpSocketStub extends bindings.Stub {
  UdpSocket _delegate = null;

  UdpSocketStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  UdpSocketStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  UdpSocketStub.unbound() : super.unbound();

  static UdpSocketStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new UdpSocketStub(endpoint);

  static const String name = UdpSocket.name;


  UdpSocketAllowAddressReuseResponseParams _UdpSocketAllowAddressReuseResponseParamsFactory(network_error_mojom.NetworkError result) {
    var result = new UdpSocketAllowAddressReuseResponseParams();
    result.result = result;
    return result;
  }
  UdpSocketBindResponseParams _UdpSocketBindResponseParamsFactory(network_error_mojom.NetworkError result, net_address_mojom.NetAddress boundAddr, Object receiver) {
    var result = new UdpSocketBindResponseParams();
    result.result = result;
    result.boundAddr = boundAddr;
    result.receiver = receiver;
    return result;
  }
  UdpSocketConnectResponseParams _UdpSocketConnectResponseParamsFactory(network_error_mojom.NetworkError result, net_address_mojom.NetAddress localAddr, Object receiver) {
    var result = new UdpSocketConnectResponseParams();
    result.result = result;
    result.localAddr = localAddr;
    result.receiver = receiver;
    return result;
  }
  UdpSocketSetSendBufferSizeResponseParams _UdpSocketSetSendBufferSizeResponseParamsFactory(network_error_mojom.NetworkError result) {
    var result = new UdpSocketSetSendBufferSizeResponseParams();
    result.result = result;
    return result;
  }
  UdpSocketSetReceiveBufferSizeResponseParams _UdpSocketSetReceiveBufferSizeResponseParamsFactory(network_error_mojom.NetworkError result) {
    var result = new UdpSocketSetReceiveBufferSizeResponseParams();
    result.result = result;
    return result;
  }
  UdpSocketNegotiateMaxPendingSendRequestsResponseParams _UdpSocketNegotiateMaxPendingSendRequestsResponseParamsFactory(int actualSize) {
    var result = new UdpSocketNegotiateMaxPendingSendRequestsResponseParams();
    result.actualSize = actualSize;
    return result;
  }
  UdpSocketSendToResponseParams _UdpSocketSendToResponseParamsFactory(network_error_mojom.NetworkError result) {
    var result = new UdpSocketSendToResponseParams();
    result.result = result;
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kUdpSocket_allowAddressReuse_name:
        var params = UdpSocketAllowAddressReuseParams.deserialize(
            message.payload);
        return _delegate.allowAddressReuse(_UdpSocketAllowAddressReuseResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kUdpSocket_allowAddressReuse_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kUdpSocket_bind_name:
        var params = UdpSocketBindParams.deserialize(
            message.payload);
        return _delegate.bind(params.addr,_UdpSocketBindResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kUdpSocket_bind_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kUdpSocket_connect_name:
        var params = UdpSocketConnectParams.deserialize(
            message.payload);
        return _delegate.connect(params.remoteAddr,_UdpSocketConnectResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kUdpSocket_connect_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kUdpSocket_setSendBufferSize_name:
        var params = UdpSocketSetSendBufferSizeParams.deserialize(
            message.payload);
        return _delegate.setSendBufferSize(params.size,_UdpSocketSetSendBufferSizeResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kUdpSocket_setSendBufferSize_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kUdpSocket_setReceiveBufferSize_name:
        var params = UdpSocketSetReceiveBufferSizeParams.deserialize(
            message.payload);
        return _delegate.setReceiveBufferSize(params.size,_UdpSocketSetReceiveBufferSizeResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kUdpSocket_setReceiveBufferSize_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kUdpSocket_negotiateMaxPendingSendRequests_name:
        var params = UdpSocketNegotiateMaxPendingSendRequestsParams.deserialize(
            message.payload);
        return _delegate.negotiateMaxPendingSendRequests(params.requestedSize,_UdpSocketNegotiateMaxPendingSendRequestsResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kUdpSocket_negotiateMaxPendingSendRequests_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kUdpSocket_receiveMore_name:
        var params = UdpSocketReceiveMoreParams.deserialize(
            message.payload);
        _delegate.receiveMore(params.datagramNumber);
        break;
      case kUdpSocket_sendTo_name:
        var params = UdpSocketSendToParams.deserialize(
            message.payload);
        return _delegate.sendTo(params.destAddr,params.data,_UdpSocketSendToResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kUdpSocket_sendTo_name,
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

  UdpSocket get delegate => _delegate;
      set delegate(UdpSocket d) {
    assert(_delegate == null);
    _delegate = d;
  }
}

const int kUdpSocketReceiver_onReceived_name = 0;

abstract class UdpSocketReceiver implements core.Listener {
  static const String name = 'mojo::UdpSocketReceiver';
  UdpSocketReceiverStub stub;

  UdpSocketReceiver(core.MojoMessagePipeEndpoint endpoint) :
      stub = new UdpSocketReceiverStub(endpoint);

  UdpSocketReceiver.fromHandle(core.MojoHandle handle) :
      stub = new UdpSocketReceiverStub.fromHandle(handle);

  UdpSocketReceiver.fromStub(this.stub);

  UdpSocketReceiver.unbound() :
      stub = new UdpSocketReceiverStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen({Function onClosed}) =>
      stub.listen(onClosed: onClosed);

  UdpSocketReceiver get delegate => stub.delegate;
  set delegate(UdpSocketReceiver d) {
    stub.delegate = d;
  }
  void onReceived(network_error_mojom.NetworkError result, net_address_mojom.NetAddress srcAddr, List<int> data);

}

class UdpSocketReceiverProxy extends bindings.Proxy implements UdpSocketReceiver {
  UdpSocketReceiverProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  UdpSocketReceiverProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  UdpSocketReceiverProxy.unbound() : super.unbound();

  String get name => UdpSocketReceiver.name;

  static UdpSocketReceiverProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new UdpSocketReceiverProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
  void onReceived(network_error_mojom.NetworkError result, net_address_mojom.NetAddress srcAddr, List<int> data) {
    var params = new UdpSocketReceiverOnReceivedParams();
    params.result = result;
    params.srcAddr = srcAddr;
    params.data = data;
    sendMessage(params, kUdpSocketReceiver_onReceived_name);
  }

}

class UdpSocketReceiverStub extends bindings.Stub {
  UdpSocketReceiver _delegate = null;

  UdpSocketReceiverStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  UdpSocketReceiverStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  UdpSocketReceiverStub.unbound() : super.unbound();

  static UdpSocketReceiverStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new UdpSocketReceiverStub(endpoint);

  static const String name = UdpSocketReceiver.name;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kUdpSocketReceiver_onReceived_name:
        var params = UdpSocketReceiverOnReceivedParams.deserialize(
            message.payload);
        _delegate.onReceived(params.result, params.srcAddr, params.data);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  UdpSocketReceiver get delegate => _delegate;
      set delegate(UdpSocketReceiver d) {
    assert(_delegate == null);
    _delegate = d;
  }
}


