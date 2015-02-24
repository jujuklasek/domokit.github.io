// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library sample_import.mojom;

import 'dart:async';
import 'dart:mojo_bindings' as bindings;
import 'dart:mojo_core' as core;

final int Shape_RECTANGLE = 1;
final int Shape_CIRCLE = Shape_RECTANGLE + 1;
final int Shape_TRIANGLE = Shape_CIRCLE + 1;
final int Shape_LAST = Shape_TRIANGLE;

final int AnotherShape_RECTANGLE = 10;
final int AnotherShape_CIRCLE = AnotherShape_RECTANGLE + 1;
final int AnotherShape_TRIANGLE = AnotherShape_CIRCLE + 1;

final int YetAnotherShape_RECTANGLE = 20;
final int YetAnotherShape_CIRCLE = YetAnotherShape_RECTANGLE + 1;
final int YetAnotherShape_TRIANGLE = YetAnotherShape_CIRCLE + 1;


class Point extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
  int x = 0;
  int y = 0;

  Point() : super(kStructSize);

  static Point deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static Point decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    Point result = new Point();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 2)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.x = decoder0.decodeInt32(8);
    }
    {
      
      result.y = decoder0.decodeInt32(12);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInt32(x, 8);
    
    encoder0.encodeInt32(y, 12);
  }
}

class ImportedInterfaceDoSomethingParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  ImportedInterfaceDoSomethingParams() : super(kStructSize);

  static ImportedInterfaceDoSomethingParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ImportedInterfaceDoSomethingParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ImportedInterfaceDoSomethingParams result = new ImportedInterfaceDoSomethingParams();

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
const int kImportedInterface_doSomething_name = 0;

abstract class ImportedInterface implements core.Listener {
  static const String name = 'imported::ImportedInterface';
  ImportedInterfaceStub stub;

  ImportedInterface(core.MojoMessagePipeEndpoint endpoint) :
      stub = new ImportedInterfaceStub(endpoint);

  ImportedInterface.fromHandle(core.MojoHandle handle) :
      stub = new ImportedInterfaceStub.fromHandle(handle);

  ImportedInterface.fromStub(this.stub);

  ImportedInterface.unbound() :
      stub = new ImportedInterfaceStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  ImportedInterface get delegate => stub.delegate;
  set delegate(ImportedInterface d) {
    stub.delegate = d;
  }
  void doSomething();

}

class ImportedInterfaceProxy extends bindings.Proxy implements ImportedInterface {
  ImportedInterfaceProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  ImportedInterfaceProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  ImportedInterfaceProxy.unbound() : super.unbound();

  String get name => ImportedInterface.name;

  static ImportedInterfaceProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ImportedInterfaceProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
  void doSomething() {
    var params = new ImportedInterfaceDoSomethingParams();
    sendMessage(params, kImportedInterface_doSomething_name);
  }

}

class ImportedInterfaceStub extends bindings.Stub {
  ImportedInterface _delegate = null;

  ImportedInterfaceStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  ImportedInterfaceStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  ImportedInterfaceStub.unbound() : super.unbound();

  static ImportedInterfaceStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ImportedInterfaceStub(endpoint);

  static const String name = ImportedInterface.name;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kImportedInterface_doSomething_name:
        var params = ImportedInterfaceDoSomethingParams.deserialize(
            message.payload);
        _delegate.doSomething();
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  ImportedInterface get delegate => _delegate;
      set delegate(ImportedInterface d) {
    assert(_delegate == null);
    _delegate = d;
  }
}




