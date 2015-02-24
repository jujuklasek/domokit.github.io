// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library recipe_value_store.mojom;

import 'dart:async';
import 'dart:mojo_bindings' as bindings;
import 'dart:mojo_core' as core;


class RecipeChangeValue extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
  List<int> oldValue = null;
  List<int> newValue = null;

  RecipeChangeValue() : super(kStructSize);

  static RecipeChangeValue deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static RecipeChangeValue decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    RecipeChangeValue result = new RecipeChangeValue();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 2)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.oldValue = decoder0.decodeUint8Array(8, bindings.kArrayNullable, bindings.kUnspecifiedArrayLength);
    }
    {
      
      result.newValue = decoder0.decodeUint8Array(16, bindings.kArrayNullable, bindings.kUnspecifiedArrayLength);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint8Array(oldValue, 8, bindings.kArrayNullable, bindings.kUnspecifiedArrayLength);
    
    encoder0.encodeUint8Array(newValue, 16, bindings.kArrayNullable, bindings.kUnspecifiedArrayLength);
  }
}

class RecipeValueStoreUpdateValuesParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  Map<String, List<int>> values = null;

  RecipeValueStoreUpdateValuesParams() : super(kStructSize);

  static RecipeValueStoreUpdateValuesParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static RecipeValueStoreUpdateValuesParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    RecipeValueStoreUpdateValuesParams result = new RecipeValueStoreUpdateValuesParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      {
        decoder1.decodeDataHeaderForMap();
        List<String> keys0;
        List<List<int>> values0;
        {
          
          var decoder2 = decoder1.decodePointer(bindings.ArrayDataHeader.kHeaderSize, false);
          {
            var si2 = decoder2.decodeDataHeaderForPointerArray(bindings.kUnspecifiedArrayLength);
            keys0 = new List<String>(si2.numElements);
            for (int i2 = 0; i2 < si2.numElements; ++i2) {
              
              keys0[i2] = decoder2.decodeString(bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i2, false);
            }
          }
        }
        {
          
          var decoder2 = decoder1.decodePointer(bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize, false);
          {
            var si2 = decoder2.decodeDataHeaderForPointerArray(keys0.length);
            values0 = new List<List<int>>(si2.numElements);
            for (int i2 = 0; i2 < si2.numElements; ++i2) {
              
              values0[i2] = decoder2.decodeUint8Array(bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i2, bindings.kNothingNullable, bindings.kUnspecifiedArrayLength);
            }
          }
        }
        result.values = new Map<String, List<int>>.fromIterables(
            keys0, values0);
      }
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    if (values == null) {
      encoder0.encodeNullPointer(8, false);
    } else {
      var encoder1 = encoder0.encoderForMap(8);
      int size0 = values.length;
      var keys0 = values.keys.toList();
      var values0 = values.values.toList();
      
      {
        var encoder2 = encoder1.encodePointerArray(keys0.length, bindings.ArrayDataHeader.kHeaderSize, bindings.kUnspecifiedArrayLength);
        for (int i1 = 0; i1 < keys0.length; ++i1) {
          
          encoder2.encodeString(keys0[i1], bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i1, false);
        }
      }
      
      {
        var encoder2 = encoder1.encodePointerArray(values0.length, bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize, bindings.kUnspecifiedArrayLength);
        for (int i1 = 0; i1 < values0.length; ++i1) {
          
          encoder2.encodeUint8Array(values0[i1], bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i1, bindings.kNothingNullable, bindings.kUnspecifiedArrayLength);
        }
      }
    }
  }
}

class RecipeValueStoreSetObserverParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  Object observer = null;

  RecipeValueStoreSetObserverParams() : super(kStructSize);

  static RecipeValueStoreSetObserverParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static RecipeValueStoreSetObserverParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    RecipeValueStoreSetObserverParams result = new RecipeValueStoreSetObserverParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.observer = decoder0.decodeServiceInterface(8, false, RecipeValueStoreObserverProxy.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInterface(observer, 8, false);
  }
}

class RecipeValueStoreObserverOnValuesChangedParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  Map<String, RecipeChangeValue> changedValues = null;

  RecipeValueStoreObserverOnValuesChangedParams() : super(kStructSize);

  static RecipeValueStoreObserverOnValuesChangedParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static RecipeValueStoreObserverOnValuesChangedParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    RecipeValueStoreObserverOnValuesChangedParams result = new RecipeValueStoreObserverOnValuesChangedParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      {
        decoder1.decodeDataHeaderForMap();
        List<String> keys0;
        List<RecipeChangeValue> values0;
        {
          
          var decoder2 = decoder1.decodePointer(bindings.ArrayDataHeader.kHeaderSize, false);
          {
            var si2 = decoder2.decodeDataHeaderForPointerArray(bindings.kUnspecifiedArrayLength);
            keys0 = new List<String>(si2.numElements);
            for (int i2 = 0; i2 < si2.numElements; ++i2) {
              
              keys0[i2] = decoder2.decodeString(bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i2, false);
            }
          }
        }
        {
          
          var decoder2 = decoder1.decodePointer(bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize, false);
          {
            var si2 = decoder2.decodeDataHeaderForPointerArray(keys0.length);
            values0 = new List<RecipeChangeValue>(si2.numElements);
            for (int i2 = 0; i2 < si2.numElements; ++i2) {
              
              var decoder3 = decoder2.decodePointer(bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i2, false);
              values0[i2] = RecipeChangeValue.decode(decoder3);
            }
          }
        }
        result.changedValues = new Map<String, RecipeChangeValue>.fromIterables(
            keys0, values0);
      }
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    if (changedValues == null) {
      encoder0.encodeNullPointer(8, false);
    } else {
      var encoder1 = encoder0.encoderForMap(8);
      int size0 = changedValues.length;
      var keys0 = changedValues.keys.toList();
      var values0 = changedValues.values.toList();
      
      {
        var encoder2 = encoder1.encodePointerArray(keys0.length, bindings.ArrayDataHeader.kHeaderSize, bindings.kUnspecifiedArrayLength);
        for (int i1 = 0; i1 < keys0.length; ++i1) {
          
          encoder2.encodeString(keys0[i1], bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i1, false);
        }
      }
      
      {
        var encoder2 = encoder1.encodePointerArray(values0.length, bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize, bindings.kUnspecifiedArrayLength);
        for (int i1 = 0; i1 < values0.length; ++i1) {
          
          encoder2.encodeStruct(values0[i1], bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i1, false);
        }
      }
    }
  }
}
const int kRecipeValueStore_updateValues_name = 0;
const int kRecipeValueStore_setObserver_name = 1;

abstract class RecipeValueStore implements core.Listener {
  static const String name = 'recipes::RecipeValueStore';
  RecipeValueStoreStub stub;

  RecipeValueStore(core.MojoMessagePipeEndpoint endpoint) :
      stub = new RecipeValueStoreStub(endpoint);

  RecipeValueStore.fromHandle(core.MojoHandle handle) :
      stub = new RecipeValueStoreStub.fromHandle(handle);

  RecipeValueStore.fromStub(this.stub);

  RecipeValueStore.unbound() :
      stub = new RecipeValueStoreStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  RecipeValueStore get delegate => stub.delegate;
  set delegate(RecipeValueStore d) {
    stub.delegate = d;
  }
  void updateValues(Map<String, List<int>> values);
  void setObserver(Object observer);

}

class RecipeValueStoreProxy extends bindings.Proxy implements RecipeValueStore {
  RecipeValueStoreProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  RecipeValueStoreProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  RecipeValueStoreProxy.unbound() : super.unbound();

  String get name => RecipeValueStore.name;

  static RecipeValueStoreProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new RecipeValueStoreProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
  void updateValues(Map<String, List<int>> values) {
    var params = new RecipeValueStoreUpdateValuesParams();
    params.values = values;
    sendMessage(params, kRecipeValueStore_updateValues_name);
  }

  void setObserver(Object observer) {
    var params = new RecipeValueStoreSetObserverParams();
    params.observer = observer;
    sendMessage(params, kRecipeValueStore_setObserver_name);
  }

}

class RecipeValueStoreStub extends bindings.Stub {
  RecipeValueStore _delegate = null;

  RecipeValueStoreStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  RecipeValueStoreStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  RecipeValueStoreStub.unbound() : super.unbound();

  static RecipeValueStoreStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new RecipeValueStoreStub(endpoint);

  static const String name = RecipeValueStore.name;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kRecipeValueStore_updateValues_name:
        var params = RecipeValueStoreUpdateValuesParams.deserialize(
            message.payload);
        _delegate.updateValues(params.values);
        break;
      case kRecipeValueStore_setObserver_name:
        var params = RecipeValueStoreSetObserverParams.deserialize(
            message.payload);
        _delegate.setObserver(params.observer);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  RecipeValueStore get delegate => _delegate;
      set delegate(RecipeValueStore d) {
    assert(_delegate == null);
    _delegate = d;
  }
}



const int kRecipeValueStoreObserver_onValuesChanged_name = 0;

abstract class RecipeValueStoreObserver implements core.Listener {
  static const String name = 'recipes::RecipeValueStoreObserver';
  RecipeValueStoreObserverStub stub;

  RecipeValueStoreObserver(core.MojoMessagePipeEndpoint endpoint) :
      stub = new RecipeValueStoreObserverStub(endpoint);

  RecipeValueStoreObserver.fromHandle(core.MojoHandle handle) :
      stub = new RecipeValueStoreObserverStub.fromHandle(handle);

  RecipeValueStoreObserver.fromStub(this.stub);

  RecipeValueStoreObserver.unbound() :
      stub = new RecipeValueStoreObserverStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  RecipeValueStoreObserver get delegate => stub.delegate;
  set delegate(RecipeValueStoreObserver d) {
    stub.delegate = d;
  }
  void onValuesChanged(Map<String, RecipeChangeValue> changedValues);

}

class RecipeValueStoreObserverProxy extends bindings.Proxy implements RecipeValueStoreObserver {
  RecipeValueStoreObserverProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  RecipeValueStoreObserverProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  RecipeValueStoreObserverProxy.unbound() : super.unbound();

  String get name => RecipeValueStoreObserver.name;

  static RecipeValueStoreObserverProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new RecipeValueStoreObserverProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
  void onValuesChanged(Map<String, RecipeChangeValue> changedValues) {
    var params = new RecipeValueStoreObserverOnValuesChangedParams();
    params.changedValues = changedValues;
    sendMessage(params, kRecipeValueStoreObserver_onValuesChanged_name);
  }

}

class RecipeValueStoreObserverStub extends bindings.Stub {
  RecipeValueStoreObserver _delegate = null;

  RecipeValueStoreObserverStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  RecipeValueStoreObserverStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  RecipeValueStoreObserverStub.unbound() : super.unbound();

  static RecipeValueStoreObserverStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new RecipeValueStoreObserverStub(endpoint);

  static const String name = RecipeValueStoreObserver.name;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kRecipeValueStoreObserver_onValuesChanged_name:
        var params = RecipeValueStoreObserverOnValuesChangedParams.deserialize(
            message.payload);
        _delegate.onValuesChanged(params.changedValues);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  RecipeValueStoreObserver get delegate => _delegate;
      set delegate(RecipeValueStoreObserver d) {
    assert(_delegate == null);
    _delegate = d;
  }
}




