// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library reaper.mojom;

import 'dart:async';
import 'mojo:bindings' as bindings;
import 'mojo:core' as core;
import 'package:services/reaper/transfer.mojom.dart' as transfer_mojom;


class ReaperGetApplicationSecretParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  ReaperGetApplicationSecretParams() : super(kStructSize);

  static ReaperGetApplicationSecretParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ReaperGetApplicationSecretParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ReaperGetApplicationSecretParams result = new ReaperGetApplicationSecretParams();

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

class ReaperGetApplicationSecretResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  int secret = 0;

  ReaperGetApplicationSecretResponseParams() : super(kStructSize);

  static ReaperGetApplicationSecretResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ReaperGetApplicationSecretResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ReaperGetApplicationSecretResponseParams result = new ReaperGetApplicationSecretResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.secret = decoder0.decodeUint64(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint64(secret, 8);
  }
}

class ReaperCreateReferenceParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
  int sourceNode = 0;
  int targetNode = 0;

  ReaperCreateReferenceParams() : super(kStructSize);

  static ReaperCreateReferenceParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ReaperCreateReferenceParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ReaperCreateReferenceParams result = new ReaperCreateReferenceParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 2)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.sourceNode = decoder0.decodeUint32(8);
    }
    {
      
      result.targetNode = decoder0.decodeUint32(12);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint32(sourceNode, 8);
    
    encoder0.encodeUint32(targetNode, 12);
  }
}

class ReaperDropNodeParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  int node = 0;

  ReaperDropNodeParams() : super(kStructSize);

  static ReaperDropNodeParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ReaperDropNodeParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ReaperDropNodeParams result = new ReaperDropNodeParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.node = decoder0.decodeUint32(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint32(node, 8);
  }
}

class ReaperStartTransferParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
  int node = 0;
  Object transfer = null;

  ReaperStartTransferParams() : super(kStructSize);

  static ReaperStartTransferParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ReaperStartTransferParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ReaperStartTransferParams result = new ReaperStartTransferParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 2)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.node = decoder0.decodeUint32(8);
    }
    {
      
      result.transfer = decoder0.decodeInterfaceRequest(12, false, transfer_mojom.TransferStub.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint32(node, 8);
    
    encoder0.encodeInterfaceRequest(transfer, 12, false);
  }
}

class ReaperPingParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  ReaperPingParams() : super(kStructSize);

  static ReaperPingParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ReaperPingParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ReaperPingParams result = new ReaperPingParams();

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

class ReaperPingResponseParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  ReaperPingResponseParams() : super(kStructSize);

  static ReaperPingResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ReaperPingResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ReaperPingResponseParams result = new ReaperPingResponseParams();

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
const int kReaper_getApplicationSecret_name = 0;
const int kReaper_createReference_name = 1;
const int kReaper_dropNode_name = 2;
const int kReaper_startTransfer_name = 3;
const int kReaper_ping_name = 4;

abstract class Reaper implements core.Listener {
  static const String name = 'reaper::Reaper';
  ReaperStub stub;

  Reaper(core.MojoMessagePipeEndpoint endpoint) :
      stub = new ReaperStub(endpoint);

  Reaper.fromHandle(core.MojoHandle handle) :
      stub = new ReaperStub.fromHandle(handle);

  Reaper.fromStub(this.stub);

  Reaper.unbound() :
      stub = new ReaperStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen({Function onClosed}) =>
      stub.listen(onClosed: onClosed);

  Reaper get delegate => stub.delegate;
  set delegate(Reaper d) {
    stub.delegate = d;
  }
  Future<ReaperGetApplicationSecretResponseParams> getApplicationSecret([Function responseFactory = null]);
  void createReference(int sourceNode, int targetNode);
  void dropNode(int node);
  void startTransfer(int node, Object transfer);
  Future<ReaperPingResponseParams> ping([Function responseFactory = null]);

}

class ReaperProxy extends bindings.Proxy implements Reaper {
  ReaperProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  ReaperProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  ReaperProxy.unbound() : super.unbound();

  String get name => Reaper.name;

  static ReaperProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ReaperProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kReaper_getApplicationSecret_name:
        var r = ReaperGetApplicationSecretResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      case kReaper_ping_name:
        var r = ReaperPingResponseParams.deserialize(
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
  Future<ReaperGetApplicationSecretResponseParams> getApplicationSecret([Function responseFactory = null]) {
    var params = new ReaperGetApplicationSecretParams();
    return sendMessageWithRequestId(
        params,
        kReaper_getApplicationSecret_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  void createReference(int sourceNode, int targetNode) {
    var params = new ReaperCreateReferenceParams();
    params.sourceNode = sourceNode;
    params.targetNode = targetNode;
    sendMessage(params, kReaper_createReference_name);
  }

  void dropNode(int node) {
    var params = new ReaperDropNodeParams();
    params.node = node;
    sendMessage(params, kReaper_dropNode_name);
  }

  void startTransfer(int node, Object transfer) {
    var params = new ReaperStartTransferParams();
    params.node = node;
    params.transfer = transfer;
    sendMessage(params, kReaper_startTransfer_name);
  }

  Future<ReaperPingResponseParams> ping([Function responseFactory = null]) {
    var params = new ReaperPingParams();
    return sendMessageWithRequestId(
        params,
        kReaper_ping_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
}

class ReaperStub extends bindings.Stub {
  Reaper _delegate = null;

  ReaperStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  ReaperStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  ReaperStub.unbound() : super.unbound();

  static ReaperStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ReaperStub(endpoint);

  static const String name = Reaper.name;


  ReaperGetApplicationSecretResponseParams _ReaperGetApplicationSecretResponseParamsFactory(int secret) {
    var result = new ReaperGetApplicationSecretResponseParams();
    result.secret = secret;
    return result;
  }
  ReaperPingResponseParams _ReaperPingResponseParamsFactory() {
    var result = new ReaperPingResponseParams();
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kReaper_getApplicationSecret_name:
        var params = ReaperGetApplicationSecretParams.deserialize(
            message.payload);
        return _delegate.getApplicationSecret(_ReaperGetApplicationSecretResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kReaper_getApplicationSecret_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kReaper_createReference_name:
        var params = ReaperCreateReferenceParams.deserialize(
            message.payload);
        _delegate.createReference(params.sourceNode, params.targetNode);
        break;
      case kReaper_dropNode_name:
        var params = ReaperDropNodeParams.deserialize(
            message.payload);
        _delegate.dropNode(params.node);
        break;
      case kReaper_startTransfer_name:
        var params = ReaperStartTransferParams.deserialize(
            message.payload);
        _delegate.startTransfer(params.node, params.transfer);
        break;
      case kReaper_ping_name:
        var params = ReaperPingParams.deserialize(
            message.payload);
        return _delegate.ping(_ReaperPingResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kReaper_ping_name,
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

  Reaper get delegate => _delegate;
      set delegate(Reaper d) {
    assert(_delegate == null);
    _delegate = d;
  }
}


