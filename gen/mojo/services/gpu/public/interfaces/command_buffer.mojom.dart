// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library command_buffer.mojom;

import 'dart:async';
import 'dart:mojo_bindings' as bindings;
import 'dart:mojo_core' as core;
import 'package:mojo/services/gpu/public/interfaces/gpu_capabilities.mojom.dart' as gpu_capabilities_mojom;


class CommandBufferState extends bindings.Struct {
  static const int kStructSize = 40;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 7);
  int numEntries = 0;
  int getOffset = 0;
  int putOffset = 0;
  int token = 0;
  int error = 0;
  int contextLostReason = 0;
  int generation = 0;

  CommandBufferState() : super(kStructSize);

  static CommandBufferState deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static CommandBufferState decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    CommandBufferState result = new CommandBufferState();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 7)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.numEntries = decoder0.decodeInt32(8);
    }
    {
      
      result.getOffset = decoder0.decodeInt32(12);
    }
    {
      
      result.putOffset = decoder0.decodeInt32(16);
    }
    {
      
      result.token = decoder0.decodeInt32(20);
    }
    {
      
      result.error = decoder0.decodeInt32(24);
    }
    {
      
      result.contextLostReason = decoder0.decodeInt32(28);
    }
    {
      
      result.generation = decoder0.decodeUint32(32);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInt32(numEntries, 8);
    
    encoder0.encodeInt32(getOffset, 12);
    
    encoder0.encodeInt32(putOffset, 16);
    
    encoder0.encodeInt32(token, 20);
    
    encoder0.encodeInt32(error, 24);
    
    encoder0.encodeInt32(contextLostReason, 28);
    
    encoder0.encodeUint32(generation, 32);
  }
}

class CommandBufferSyncClientDidInitializeParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
  bool success = false;
  gpu_capabilities_mojom.GpuCapabilities capabilities = null;

  CommandBufferSyncClientDidInitializeParams() : super(kStructSize);

  static CommandBufferSyncClientDidInitializeParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static CommandBufferSyncClientDidInitializeParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    CommandBufferSyncClientDidInitializeParams result = new CommandBufferSyncClientDidInitializeParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 2)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.success = decoder0.decodeBool(8, 0);
    }
    {
      
      var decoder1 = decoder0.decodePointer(16, false);
      result.capabilities = gpu_capabilities_mojom.GpuCapabilities.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeBool(success, 8, 0);
    
    encoder0.encodeStruct(capabilities, 16, false);
  }
}

class CommandBufferSyncClientDidMakeProgressParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  CommandBufferState state = null;

  CommandBufferSyncClientDidMakeProgressParams() : super(kStructSize);

  static CommandBufferSyncClientDidMakeProgressParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static CommandBufferSyncClientDidMakeProgressParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    CommandBufferSyncClientDidMakeProgressParams result = new CommandBufferSyncClientDidMakeProgressParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.state = CommandBufferState.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(state, 8, false);
  }
}

class CommandBufferSyncPointClientDidInsertSyncPointParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  int syncPoint = 0;

  CommandBufferSyncPointClientDidInsertSyncPointParams() : super(kStructSize);

  static CommandBufferSyncPointClientDidInsertSyncPointParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static CommandBufferSyncPointClientDidInsertSyncPointParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    CommandBufferSyncPointClientDidInsertSyncPointParams result = new CommandBufferSyncPointClientDidInsertSyncPointParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.syncPoint = decoder0.decodeUint32(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint32(syncPoint, 8);
  }
}

class CommandBufferLostContextObserverDidLoseContextParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  int contextLostReason = 0;

  CommandBufferLostContextObserverDidLoseContextParams() : super(kStructSize);

  static CommandBufferLostContextObserverDidLoseContextParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static CommandBufferLostContextObserverDidLoseContextParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    CommandBufferLostContextObserverDidLoseContextParams result = new CommandBufferLostContextObserverDidLoseContextParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.contextLostReason = decoder0.decodeInt32(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInt32(contextLostReason, 8);
  }
}

class CommandBufferInitializeParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 4);
  Object syncClient = null;
  Object syncPointClient = null;
  Object lostObserver = null;
  core.MojoSharedBuffer sharedState = null;

  CommandBufferInitializeParams() : super(kStructSize);

  static CommandBufferInitializeParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static CommandBufferInitializeParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    CommandBufferInitializeParams result = new CommandBufferInitializeParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 4)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.syncClient = decoder0.decodeServiceInterface(8, false, CommandBufferSyncClientProxy.newFromEndpoint);
    }
    {
      
      result.syncPointClient = decoder0.decodeServiceInterface(12, false, CommandBufferSyncPointClientProxy.newFromEndpoint);
    }
    {
      
      result.lostObserver = decoder0.decodeServiceInterface(16, false, CommandBufferLostContextObserverProxy.newFromEndpoint);
    }
    {
      
      result.sharedState = decoder0.decodeSharedBufferHandle(20, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInterface(syncClient, 8, false);
    
    encoder0.encodeInterface(syncPointClient, 12, false);
    
    encoder0.encodeInterface(lostObserver, 16, false);
    
    encoder0.encodeSharedBufferHandle(sharedState, 20, false);
  }
}

class CommandBufferSetGetBufferParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  int buffer = 0;

  CommandBufferSetGetBufferParams() : super(kStructSize);

  static CommandBufferSetGetBufferParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static CommandBufferSetGetBufferParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    CommandBufferSetGetBufferParams result = new CommandBufferSetGetBufferParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.buffer = decoder0.decodeInt32(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInt32(buffer, 8);
  }
}

class CommandBufferFlushParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  int putOffset = 0;

  CommandBufferFlushParams() : super(kStructSize);

  static CommandBufferFlushParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static CommandBufferFlushParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    CommandBufferFlushParams result = new CommandBufferFlushParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.putOffset = decoder0.decodeInt32(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInt32(putOffset, 8);
  }
}

class CommandBufferMakeProgressParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  int lastGetOffset = 0;

  CommandBufferMakeProgressParams() : super(kStructSize);

  static CommandBufferMakeProgressParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static CommandBufferMakeProgressParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    CommandBufferMakeProgressParams result = new CommandBufferMakeProgressParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.lastGetOffset = decoder0.decodeInt32(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInt32(lastGetOffset, 8);
  }
}

class CommandBufferRegisterTransferBufferParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 3);
  int id = 0;
  core.MojoSharedBuffer transferBuffer = null;
  int size = 0;

  CommandBufferRegisterTransferBufferParams() : super(kStructSize);

  static CommandBufferRegisterTransferBufferParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static CommandBufferRegisterTransferBufferParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    CommandBufferRegisterTransferBufferParams result = new CommandBufferRegisterTransferBufferParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 3)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.id = decoder0.decodeInt32(8);
    }
    {
      
      result.transferBuffer = decoder0.decodeSharedBufferHandle(12, false);
    }
    {
      
      result.size = decoder0.decodeUint32(16);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInt32(id, 8);
    
    encoder0.encodeSharedBufferHandle(transferBuffer, 12, false);
    
    encoder0.encodeUint32(size, 16);
  }
}

class CommandBufferDestroyTransferBufferParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  int id = 0;

  CommandBufferDestroyTransferBufferParams() : super(kStructSize);

  static CommandBufferDestroyTransferBufferParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static CommandBufferDestroyTransferBufferParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    CommandBufferDestroyTransferBufferParams result = new CommandBufferDestroyTransferBufferParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.id = decoder0.decodeInt32(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInt32(id, 8);
  }
}

class CommandBufferInsertSyncPointParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  bool retire = false;

  CommandBufferInsertSyncPointParams() : super(kStructSize);

  static CommandBufferInsertSyncPointParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static CommandBufferInsertSyncPointParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    CommandBufferInsertSyncPointParams result = new CommandBufferInsertSyncPointParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.retire = decoder0.decodeBool(8, 0);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeBool(retire, 8, 0);
  }
}

class CommandBufferRetireSyncPointParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  int syncPoint = 0;

  CommandBufferRetireSyncPointParams() : super(kStructSize);

  static CommandBufferRetireSyncPointParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static CommandBufferRetireSyncPointParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    CommandBufferRetireSyncPointParams result = new CommandBufferRetireSyncPointParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.syncPoint = decoder0.decodeUint32(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint32(syncPoint, 8);
  }
}

class CommandBufferEchoParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  CommandBufferEchoParams() : super(kStructSize);

  static CommandBufferEchoParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static CommandBufferEchoParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    CommandBufferEchoParams result = new CommandBufferEchoParams();

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

class CommandBufferEchoResponseParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  CommandBufferEchoResponseParams() : super(kStructSize);

  static CommandBufferEchoResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static CommandBufferEchoResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    CommandBufferEchoResponseParams result = new CommandBufferEchoResponseParams();

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
const int kCommandBufferSyncClient_didInitialize_name = 0;
const int kCommandBufferSyncClient_didMakeProgress_name = 1;

abstract class CommandBufferSyncClient implements core.Listener {
  static const String name = 'mojo::CommandBufferSyncClient';
  CommandBufferSyncClientStub stub;

  CommandBufferSyncClient(core.MojoMessagePipeEndpoint endpoint) :
      stub = new CommandBufferSyncClientStub(endpoint);

  CommandBufferSyncClient.fromHandle(core.MojoHandle handle) :
      stub = new CommandBufferSyncClientStub.fromHandle(handle);

  CommandBufferSyncClient.fromStub(this.stub);

  CommandBufferSyncClient.unbound() :
      stub = new CommandBufferSyncClientStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  CommandBufferSyncClient get delegate => stub.delegate;
  set delegate(CommandBufferSyncClient d) {
    stub.delegate = d;
  }
  void didInitialize(bool success, gpu_capabilities_mojom.GpuCapabilities capabilities);
  void didMakeProgress(CommandBufferState state);

}

class CommandBufferSyncClientProxy extends bindings.Proxy implements CommandBufferSyncClient {
  CommandBufferSyncClientProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  CommandBufferSyncClientProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  CommandBufferSyncClientProxy.unbound() : super.unbound();

  String get name => CommandBufferSyncClient.name;

  static CommandBufferSyncClientProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new CommandBufferSyncClientProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
  void didInitialize(bool success, gpu_capabilities_mojom.GpuCapabilities capabilities) {
    var params = new CommandBufferSyncClientDidInitializeParams();
    params.success = success;
    params.capabilities = capabilities;
    sendMessage(params, kCommandBufferSyncClient_didInitialize_name);
  }

  void didMakeProgress(CommandBufferState state) {
    var params = new CommandBufferSyncClientDidMakeProgressParams();
    params.state = state;
    sendMessage(params, kCommandBufferSyncClient_didMakeProgress_name);
  }

}

class CommandBufferSyncClientStub extends bindings.Stub {
  CommandBufferSyncClient _delegate = null;

  CommandBufferSyncClientStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  CommandBufferSyncClientStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  CommandBufferSyncClientStub.unbound() : super.unbound();

  static CommandBufferSyncClientStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new CommandBufferSyncClientStub(endpoint);

  static const String name = CommandBufferSyncClient.name;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kCommandBufferSyncClient_didInitialize_name:
        var params = CommandBufferSyncClientDidInitializeParams.deserialize(
            message.payload);
        _delegate.didInitialize(params.success, params.capabilities);
        break;
      case kCommandBufferSyncClient_didMakeProgress_name:
        var params = CommandBufferSyncClientDidMakeProgressParams.deserialize(
            message.payload);
        _delegate.didMakeProgress(params.state);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  CommandBufferSyncClient get delegate => _delegate;
      set delegate(CommandBufferSyncClient d) {
    assert(_delegate == null);
    _delegate = d;
  }
}



const int kCommandBufferSyncPointClient_didInsertSyncPoint_name = 0;

abstract class CommandBufferSyncPointClient implements core.Listener {
  static const String name = 'mojo::CommandBufferSyncPointClient';
  CommandBufferSyncPointClientStub stub;

  CommandBufferSyncPointClient(core.MojoMessagePipeEndpoint endpoint) :
      stub = new CommandBufferSyncPointClientStub(endpoint);

  CommandBufferSyncPointClient.fromHandle(core.MojoHandle handle) :
      stub = new CommandBufferSyncPointClientStub.fromHandle(handle);

  CommandBufferSyncPointClient.fromStub(this.stub);

  CommandBufferSyncPointClient.unbound() :
      stub = new CommandBufferSyncPointClientStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  CommandBufferSyncPointClient get delegate => stub.delegate;
  set delegate(CommandBufferSyncPointClient d) {
    stub.delegate = d;
  }
  void didInsertSyncPoint(int syncPoint);

}

class CommandBufferSyncPointClientProxy extends bindings.Proxy implements CommandBufferSyncPointClient {
  CommandBufferSyncPointClientProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  CommandBufferSyncPointClientProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  CommandBufferSyncPointClientProxy.unbound() : super.unbound();

  String get name => CommandBufferSyncPointClient.name;

  static CommandBufferSyncPointClientProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new CommandBufferSyncPointClientProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
  void didInsertSyncPoint(int syncPoint) {
    var params = new CommandBufferSyncPointClientDidInsertSyncPointParams();
    params.syncPoint = syncPoint;
    sendMessage(params, kCommandBufferSyncPointClient_didInsertSyncPoint_name);
  }

}

class CommandBufferSyncPointClientStub extends bindings.Stub {
  CommandBufferSyncPointClient _delegate = null;

  CommandBufferSyncPointClientStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  CommandBufferSyncPointClientStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  CommandBufferSyncPointClientStub.unbound() : super.unbound();

  static CommandBufferSyncPointClientStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new CommandBufferSyncPointClientStub(endpoint);

  static const String name = CommandBufferSyncPointClient.name;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kCommandBufferSyncPointClient_didInsertSyncPoint_name:
        var params = CommandBufferSyncPointClientDidInsertSyncPointParams.deserialize(
            message.payload);
        _delegate.didInsertSyncPoint(params.syncPoint);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  CommandBufferSyncPointClient get delegate => _delegate;
      set delegate(CommandBufferSyncPointClient d) {
    assert(_delegate == null);
    _delegate = d;
  }
}



const int kCommandBufferLostContextObserver_didLoseContext_name = 0;

abstract class CommandBufferLostContextObserver implements core.Listener {
  static const String name = 'mojo::CommandBufferLostContextObserver';
  CommandBufferLostContextObserverStub stub;

  CommandBufferLostContextObserver(core.MojoMessagePipeEndpoint endpoint) :
      stub = new CommandBufferLostContextObserverStub(endpoint);

  CommandBufferLostContextObserver.fromHandle(core.MojoHandle handle) :
      stub = new CommandBufferLostContextObserverStub.fromHandle(handle);

  CommandBufferLostContextObserver.fromStub(this.stub);

  CommandBufferLostContextObserver.unbound() :
      stub = new CommandBufferLostContextObserverStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  CommandBufferLostContextObserver get delegate => stub.delegate;
  set delegate(CommandBufferLostContextObserver d) {
    stub.delegate = d;
  }
  void didLoseContext(int contextLostReason);

}

class CommandBufferLostContextObserverProxy extends bindings.Proxy implements CommandBufferLostContextObserver {
  CommandBufferLostContextObserverProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  CommandBufferLostContextObserverProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  CommandBufferLostContextObserverProxy.unbound() : super.unbound();

  String get name => CommandBufferLostContextObserver.name;

  static CommandBufferLostContextObserverProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new CommandBufferLostContextObserverProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
  void didLoseContext(int contextLostReason) {
    var params = new CommandBufferLostContextObserverDidLoseContextParams();
    params.contextLostReason = contextLostReason;
    sendMessage(params, kCommandBufferLostContextObserver_didLoseContext_name);
  }

}

class CommandBufferLostContextObserverStub extends bindings.Stub {
  CommandBufferLostContextObserver _delegate = null;

  CommandBufferLostContextObserverStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  CommandBufferLostContextObserverStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  CommandBufferLostContextObserverStub.unbound() : super.unbound();

  static CommandBufferLostContextObserverStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new CommandBufferLostContextObserverStub(endpoint);

  static const String name = CommandBufferLostContextObserver.name;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kCommandBufferLostContextObserver_didLoseContext_name:
        var params = CommandBufferLostContextObserverDidLoseContextParams.deserialize(
            message.payload);
        _delegate.didLoseContext(params.contextLostReason);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  CommandBufferLostContextObserver get delegate => _delegate;
      set delegate(CommandBufferLostContextObserver d) {
    assert(_delegate == null);
    _delegate = d;
  }
}



const int kCommandBuffer_initialize_name = 0;
const int kCommandBuffer_setGetBuffer_name = 1;
const int kCommandBuffer_flush_name = 2;
const int kCommandBuffer_makeProgress_name = 3;
const int kCommandBuffer_registerTransferBuffer_name = 4;
const int kCommandBuffer_destroyTransferBuffer_name = 5;
const int kCommandBuffer_insertSyncPoint_name = 6;
const int kCommandBuffer_retireSyncPoint_name = 7;
const int kCommandBuffer_echo_name = 8;

abstract class CommandBuffer implements core.Listener {
  static const String name = 'mojo::CommandBuffer';
  CommandBufferStub stub;

  CommandBuffer(core.MojoMessagePipeEndpoint endpoint) :
      stub = new CommandBufferStub(endpoint);

  CommandBuffer.fromHandle(core.MojoHandle handle) :
      stub = new CommandBufferStub.fromHandle(handle);

  CommandBuffer.fromStub(this.stub);

  CommandBuffer.unbound() :
      stub = new CommandBufferStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  CommandBuffer get delegate => stub.delegate;
  set delegate(CommandBuffer d) {
    stub.delegate = d;
  }
  void initialize(Object syncClient, Object syncPointClient, Object lostObserver, core.MojoSharedBuffer sharedState);
  void setGetBuffer(int buffer);
  void flush(int putOffset);
  void makeProgress(int lastGetOffset);
  void registerTransferBuffer(int id, core.MojoSharedBuffer transferBuffer, int size);
  void destroyTransferBuffer(int id);
  void insertSyncPoint(bool retire);
  void retireSyncPoint(int syncPoint);
  Future<CommandBufferEchoResponseParams> echo([Function responseFactory = null]);

}

class CommandBufferProxy extends bindings.Proxy implements CommandBuffer {
  CommandBufferProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  CommandBufferProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  CommandBufferProxy.unbound() : super.unbound();

  String get name => CommandBuffer.name;

  static CommandBufferProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new CommandBufferProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kCommandBuffer_echo_name:
        var r = CommandBufferEchoResponseParams.deserialize(
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
  void initialize(Object syncClient, Object syncPointClient, Object lostObserver, core.MojoSharedBuffer sharedState) {
    var params = new CommandBufferInitializeParams();
    params.syncClient = syncClient;
    params.syncPointClient = syncPointClient;
    params.lostObserver = lostObserver;
    params.sharedState = sharedState;
    sendMessage(params, kCommandBuffer_initialize_name);
  }

  void setGetBuffer(int buffer) {
    var params = new CommandBufferSetGetBufferParams();
    params.buffer = buffer;
    sendMessage(params, kCommandBuffer_setGetBuffer_name);
  }

  void flush(int putOffset) {
    var params = new CommandBufferFlushParams();
    params.putOffset = putOffset;
    sendMessage(params, kCommandBuffer_flush_name);
  }

  void makeProgress(int lastGetOffset) {
    var params = new CommandBufferMakeProgressParams();
    params.lastGetOffset = lastGetOffset;
    sendMessage(params, kCommandBuffer_makeProgress_name);
  }

  void registerTransferBuffer(int id, core.MojoSharedBuffer transferBuffer, int size) {
    var params = new CommandBufferRegisterTransferBufferParams();
    params.id = id;
    params.transferBuffer = transferBuffer;
    params.size = size;
    sendMessage(params, kCommandBuffer_registerTransferBuffer_name);
  }

  void destroyTransferBuffer(int id) {
    var params = new CommandBufferDestroyTransferBufferParams();
    params.id = id;
    sendMessage(params, kCommandBuffer_destroyTransferBuffer_name);
  }

  void insertSyncPoint(bool retire) {
    var params = new CommandBufferInsertSyncPointParams();
    params.retire = retire;
    sendMessage(params, kCommandBuffer_insertSyncPoint_name);
  }

  void retireSyncPoint(int syncPoint) {
    var params = new CommandBufferRetireSyncPointParams();
    params.syncPoint = syncPoint;
    sendMessage(params, kCommandBuffer_retireSyncPoint_name);
  }

  Future<CommandBufferEchoResponseParams> echo([Function responseFactory = null]) {
    var params = new CommandBufferEchoParams();
    return sendMessageWithRequestId(
        params,
        kCommandBuffer_echo_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
}

class CommandBufferStub extends bindings.Stub {
  CommandBuffer _delegate = null;

  CommandBufferStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  CommandBufferStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  CommandBufferStub.unbound() : super.unbound();

  static CommandBufferStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new CommandBufferStub(endpoint);

  static const String name = CommandBuffer.name;


  CommandBufferEchoResponseParams _CommandBufferEchoResponseParamsFactory() {
    var result = new CommandBufferEchoResponseParams();
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kCommandBuffer_initialize_name:
        var params = CommandBufferInitializeParams.deserialize(
            message.payload);
        _delegate.initialize(params.syncClient, params.syncPointClient, params.lostObserver, params.sharedState);
        break;
      case kCommandBuffer_setGetBuffer_name:
        var params = CommandBufferSetGetBufferParams.deserialize(
            message.payload);
        _delegate.setGetBuffer(params.buffer);
        break;
      case kCommandBuffer_flush_name:
        var params = CommandBufferFlushParams.deserialize(
            message.payload);
        _delegate.flush(params.putOffset);
        break;
      case kCommandBuffer_makeProgress_name:
        var params = CommandBufferMakeProgressParams.deserialize(
            message.payload);
        _delegate.makeProgress(params.lastGetOffset);
        break;
      case kCommandBuffer_registerTransferBuffer_name:
        var params = CommandBufferRegisterTransferBufferParams.deserialize(
            message.payload);
        _delegate.registerTransferBuffer(params.id, params.transferBuffer, params.size);
        break;
      case kCommandBuffer_destroyTransferBuffer_name:
        var params = CommandBufferDestroyTransferBufferParams.deserialize(
            message.payload);
        _delegate.destroyTransferBuffer(params.id);
        break;
      case kCommandBuffer_insertSyncPoint_name:
        var params = CommandBufferInsertSyncPointParams.deserialize(
            message.payload);
        _delegate.insertSyncPoint(params.retire);
        break;
      case kCommandBuffer_retireSyncPoint_name:
        var params = CommandBufferRetireSyncPointParams.deserialize(
            message.payload);
        _delegate.retireSyncPoint(params.syncPoint);
        break;
      case kCommandBuffer_echo_name:
        var params = CommandBufferEchoParams.deserialize(
            message.payload);
        return _delegate.echo(_CommandBufferEchoResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kCommandBuffer_echo_name,
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

  CommandBuffer get delegate => _delegate;
      set delegate(CommandBuffer d) {
    assert(_delegate == null);
    _delegate = d;
  }
}




