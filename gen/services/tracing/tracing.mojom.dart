// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library tracing.mojom;

import 'dart:async';
import 'mojo:bindings' as bindings;
import 'mojo:core' as core;


class TraceControllerStartTracingParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
  String categories = null;
  Object collector = null;

  TraceControllerStartTracingParams() : super(kStructSize);

  static TraceControllerStartTracingParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TraceControllerStartTracingParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TraceControllerStartTracingParams result = new TraceControllerStartTracingParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 2)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.categories = decoder0.decodeString(8, false);
    }
    {
      
      result.collector = decoder0.decodeServiceInterface(16, false, TraceDataCollectorProxy.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeString(categories, 8, false);
    
    encoder0.encodeInterface(collector, 16, false);
  }
}

class TraceControllerStopTracingParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  TraceControllerStopTracingParams() : super(kStructSize);

  static TraceControllerStopTracingParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TraceControllerStopTracingParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TraceControllerStopTracingParams result = new TraceControllerStopTracingParams();

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

class TraceDataCollectorDataCollectedParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  String json = null;

  TraceDataCollectorDataCollectedParams() : super(kStructSize);

  static TraceDataCollectorDataCollectedParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TraceDataCollectorDataCollectedParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TraceDataCollectorDataCollectedParams result = new TraceDataCollectorDataCollectedParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.json = decoder0.decodeString(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeString(json, 8, false);
  }
}

class TraceCoordinatorStartParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
  core.MojoDataPipeProducer stream = null;
  String categories = null;

  TraceCoordinatorStartParams() : super(kStructSize);

  static TraceCoordinatorStartParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TraceCoordinatorStartParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TraceCoordinatorStartParams result = new TraceCoordinatorStartParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 2)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.stream = decoder0.decodeProducerHandle(8, false);
    }
    {
      
      result.categories = decoder0.decodeString(16, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeProducerHandle(stream, 8, false);
    
    encoder0.encodeString(categories, 16, false);
  }
}

class TraceCoordinatorStopAndFlushParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  TraceCoordinatorStopAndFlushParams() : super(kStructSize);

  static TraceCoordinatorStopAndFlushParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TraceCoordinatorStopAndFlushParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TraceCoordinatorStopAndFlushParams result = new TraceCoordinatorStopAndFlushParams();

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
const int kTraceController_startTracing_name = 0;
const int kTraceController_stopTracing_name = 1;

abstract class TraceController implements core.Listener {
  static const String name = 'tracing::TraceController';
  TraceControllerStub stub;

  TraceController(core.MojoMessagePipeEndpoint endpoint) :
      stub = new TraceControllerStub(endpoint);

  TraceController.fromHandle(core.MojoHandle handle) :
      stub = new TraceControllerStub.fromHandle(handle);

  TraceController.fromStub(this.stub);

  TraceController.unbound() :
      stub = new TraceControllerStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  TraceController get delegate => stub.delegate;
  set delegate(TraceController d) {
    stub.delegate = d;
  }
  void startTracing(String categories, Object collector);
  void stopTracing();

}

class TraceControllerProxy extends bindings.Proxy implements TraceController {
  TraceControllerProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  TraceControllerProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  TraceControllerProxy.unbound() : super.unbound();

  String get name => TraceController.name;

  static TraceControllerProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TraceControllerProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
  void startTracing(String categories, Object collector) {
    var params = new TraceControllerStartTracingParams();
    params.categories = categories;
    params.collector = collector;
    sendMessage(params, kTraceController_startTracing_name);
  }

  void stopTracing() {
    var params = new TraceControllerStopTracingParams();
    sendMessage(params, kTraceController_stopTracing_name);
  }

}

class TraceControllerStub extends bindings.Stub {
  TraceController _delegate = null;

  TraceControllerStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  TraceControllerStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  TraceControllerStub.unbound() : super.unbound();

  static TraceControllerStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TraceControllerStub(endpoint);

  static const String name = TraceController.name;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kTraceController_startTracing_name:
        var params = TraceControllerStartTracingParams.deserialize(
            message.payload);
        _delegate.startTracing(params.categories, params.collector);
        break;
      case kTraceController_stopTracing_name:
        var params = TraceControllerStopTracingParams.deserialize(
            message.payload);
        _delegate.stopTracing();
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  TraceController get delegate => _delegate;
      set delegate(TraceController d) {
    assert(_delegate == null);
    _delegate = d;
  }
}



const int kTraceDataCollector_dataCollected_name = 0;

abstract class TraceDataCollector implements core.Listener {
  static const String name = 'tracing::TraceDataCollector';
  TraceDataCollectorStub stub;

  TraceDataCollector(core.MojoMessagePipeEndpoint endpoint) :
      stub = new TraceDataCollectorStub(endpoint);

  TraceDataCollector.fromHandle(core.MojoHandle handle) :
      stub = new TraceDataCollectorStub.fromHandle(handle);

  TraceDataCollector.fromStub(this.stub);

  TraceDataCollector.unbound() :
      stub = new TraceDataCollectorStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  TraceDataCollector get delegate => stub.delegate;
  set delegate(TraceDataCollector d) {
    stub.delegate = d;
  }
  void dataCollected(String json);

}

class TraceDataCollectorProxy extends bindings.Proxy implements TraceDataCollector {
  TraceDataCollectorProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  TraceDataCollectorProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  TraceDataCollectorProxy.unbound() : super.unbound();

  String get name => TraceDataCollector.name;

  static TraceDataCollectorProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TraceDataCollectorProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
  void dataCollected(String json) {
    var params = new TraceDataCollectorDataCollectedParams();
    params.json = json;
    sendMessage(params, kTraceDataCollector_dataCollected_name);
  }

}

class TraceDataCollectorStub extends bindings.Stub {
  TraceDataCollector _delegate = null;

  TraceDataCollectorStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  TraceDataCollectorStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  TraceDataCollectorStub.unbound() : super.unbound();

  static TraceDataCollectorStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TraceDataCollectorStub(endpoint);

  static const String name = TraceDataCollector.name;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kTraceDataCollector_dataCollected_name:
        var params = TraceDataCollectorDataCollectedParams.deserialize(
            message.payload);
        _delegate.dataCollected(params.json);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  TraceDataCollector get delegate => _delegate;
      set delegate(TraceDataCollector d) {
    assert(_delegate == null);
    _delegate = d;
  }
}



const int kTraceCoordinator_start_name = 0;
const int kTraceCoordinator_stopAndFlush_name = 1;

abstract class TraceCoordinator implements core.Listener {
  static const String name = 'tracing::TraceCoordinator';
  TraceCoordinatorStub stub;

  TraceCoordinator(core.MojoMessagePipeEndpoint endpoint) :
      stub = new TraceCoordinatorStub(endpoint);

  TraceCoordinator.fromHandle(core.MojoHandle handle) :
      stub = new TraceCoordinatorStub.fromHandle(handle);

  TraceCoordinator.fromStub(this.stub);

  TraceCoordinator.unbound() :
      stub = new TraceCoordinatorStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  TraceCoordinator get delegate => stub.delegate;
  set delegate(TraceCoordinator d) {
    stub.delegate = d;
  }
  void start(core.MojoDataPipeProducer stream, String categories);
  void stopAndFlush();

}

class TraceCoordinatorProxy extends bindings.Proxy implements TraceCoordinator {
  TraceCoordinatorProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  TraceCoordinatorProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  TraceCoordinatorProxy.unbound() : super.unbound();

  String get name => TraceCoordinator.name;

  static TraceCoordinatorProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TraceCoordinatorProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
  void start(core.MojoDataPipeProducer stream, String categories) {
    var params = new TraceCoordinatorStartParams();
    params.stream = stream;
    params.categories = categories;
    sendMessage(params, kTraceCoordinator_start_name);
  }

  void stopAndFlush() {
    var params = new TraceCoordinatorStopAndFlushParams();
    sendMessage(params, kTraceCoordinator_stopAndFlush_name);
  }

}

class TraceCoordinatorStub extends bindings.Stub {
  TraceCoordinator _delegate = null;

  TraceCoordinatorStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  TraceCoordinatorStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  TraceCoordinatorStub.unbound() : super.unbound();

  static TraceCoordinatorStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TraceCoordinatorStub(endpoint);

  static const String name = TraceCoordinator.name;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kTraceCoordinator_start_name:
        var params = TraceCoordinatorStartParams.deserialize(
            message.payload);
        _delegate.start(params.stream, params.categories);
        break;
      case kTraceCoordinator_stopAndFlush_name:
        var params = TraceCoordinatorStopAndFlushParams.deserialize(
            message.payload);
        _delegate.stopAndFlush();
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  TraceCoordinator get delegate => _delegate;
      set delegate(TraceCoordinator d) {
    assert(_delegate == null);
    _delegate = d;
  }
}




