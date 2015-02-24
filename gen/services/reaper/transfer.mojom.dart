// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library transfer.mojom;

import 'dart:async';
import 'dart:mojo_bindings' as bindings;
import 'dart:mojo_core' as core;


class TransferCompleteParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
  int applicationSecret = 0;
  int node = 0;

  TransferCompleteParams() : super(kStructSize);

  static TransferCompleteParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TransferCompleteParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TransferCompleteParams result = new TransferCompleteParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 2)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.applicationSecret = decoder0.decodeUint64(8);
    }
    {
      
      result.node = decoder0.decodeUint32(16);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint64(applicationSecret, 8);
    
    encoder0.encodeUint32(node, 16);
  }
}

class TransferPingParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  TransferPingParams() : super(kStructSize);

  static TransferPingParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TransferPingParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TransferPingParams result = new TransferPingParams();

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

class TransferPingResponseParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  TransferPingResponseParams() : super(kStructSize);

  static TransferPingResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TransferPingResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TransferPingResponseParams result = new TransferPingResponseParams();

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
const int kTransfer_complete_name = 0;
const int kTransfer_ping_name = 1;

abstract class Transfer implements core.Listener {
  static const String name = 'reaper::Transfer';
  TransferStub stub;

  Transfer(core.MojoMessagePipeEndpoint endpoint) :
      stub = new TransferStub(endpoint);

  Transfer.fromHandle(core.MojoHandle handle) :
      stub = new TransferStub.fromHandle(handle);

  Transfer.fromStub(this.stub);

  Transfer.unbound() :
      stub = new TransferStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  Transfer get delegate => stub.delegate;
  set delegate(Transfer d) {
    stub.delegate = d;
  }
  void complete(int applicationSecret, int node);
  Future<TransferPingResponseParams> ping([Function responseFactory = null]);

}

class TransferProxy extends bindings.Proxy implements Transfer {
  TransferProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  TransferProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  TransferProxy.unbound() : super.unbound();

  String get name => Transfer.name;

  static TransferProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TransferProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kTransfer_ping_name:
        var r = TransferPingResponseParams.deserialize(
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
  void complete(int applicationSecret, int node) {
    var params = new TransferCompleteParams();
    params.applicationSecret = applicationSecret;
    params.node = node;
    sendMessage(params, kTransfer_complete_name);
  }

  Future<TransferPingResponseParams> ping([Function responseFactory = null]) {
    var params = new TransferPingParams();
    return sendMessageWithRequestId(
        params,
        kTransfer_ping_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
}

class TransferStub extends bindings.Stub {
  Transfer _delegate = null;

  TransferStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  TransferStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  TransferStub.unbound() : super.unbound();

  static TransferStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TransferStub(endpoint);

  static const String name = Transfer.name;


  TransferPingResponseParams _TransferPingResponseParamsFactory() {
    var result = new TransferPingResponseParams();
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kTransfer_complete_name:
        var params = TransferCompleteParams.deserialize(
            message.payload);
        _delegate.complete(params.applicationSecret, params.node);
        break;
      case kTransfer_ping_name:
        var params = TransferPingParams.deserialize(
            message.payload);
        return _delegate.ping(_TransferPingResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kTransfer_ping_name,
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

  Transfer get delegate => _delegate;
      set delegate(Transfer d) {
    assert(_delegate == null);
    _delegate = d;
  }
}




