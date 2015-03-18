// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library recipe_value_store.mojom;

import 'dart:async';
import 'dart:mojo.bindings' as bindings;
import 'dart:mojo.core' as core;


class RecipeChangeValue extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
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
        (mainDataHeader.version < 0)) {
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

  String toString() {
    return "RecipeChangeValue("
           "oldValue: $oldValue" ", "
           "newValue: $newValue" ")";
  }
}

class RecipeValueStoreUpdateValuesParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
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
        (mainDataHeader.version < 0)) {
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

  String toString() {
    return "RecipeValueStoreUpdateValuesParams("
           "values: $values" ")";
  }
}

class RecipeValueStoreSetObserverParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
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
        (mainDataHeader.version < 0)) {
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

  String toString() {
    return "RecipeValueStoreSetObserverParams("
           "observer: $observer" ")";
  }
}

class RecipeValueStoreObserverOnValuesChangedParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
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
        (mainDataHeader.version < 0)) {
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

  String toString() {
    return "RecipeValueStoreObserverOnValuesChangedParams("
           "changedValues: $changedValues" ")";
  }
}
const int kRecipeValueStore_updateValues_name = 0;
const int kRecipeValueStore_setObserver_name = 1;

const String RecipeValueStoreName =
      'recipes::RecipeValueStore';

abstract class RecipeValueStore {
  void updateValues(Map<String, List<int>> values);
  void setObserver(Object observer);

}


class RecipeValueStoreProxyImpl extends bindings.Proxy {
  RecipeValueStoreProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  RecipeValueStoreProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  RecipeValueStoreProxyImpl.unbound() : super.unbound();

  static RecipeValueStoreProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new RecipeValueStoreProxyImpl.fromEndpoint(endpoint);

  String get name => RecipeValueStoreName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }

  String toString() {
    var superString = super.toString();
    return "RecipeValueStoreProxyImpl($superString)";
  }
}


class _RecipeValueStoreProxyCalls implements RecipeValueStore {
  RecipeValueStoreProxyImpl _proxyImpl;

  _RecipeValueStoreProxyCalls(this._proxyImpl);
    void updateValues(Map<String, List<int>> values) {
      assert(_proxyImpl.isBound);
      var params = new RecipeValueStoreUpdateValuesParams();
      params.values = values;
      _proxyImpl.sendMessage(params, kRecipeValueStore_updateValues_name);
    }
  
    void setObserver(Object observer) {
      assert(_proxyImpl.isBound);
      var params = new RecipeValueStoreSetObserverParams();
      params.observer = observer;
      _proxyImpl.sendMessage(params, kRecipeValueStore_setObserver_name);
    }
  
}


class RecipeValueStoreProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  RecipeValueStore ptr;
  final String name = RecipeValueStoreName;

  RecipeValueStoreProxy(RecipeValueStoreProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _RecipeValueStoreProxyCalls(proxyImpl);

  RecipeValueStoreProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new RecipeValueStoreProxyImpl.fromEndpoint(endpoint) {
    ptr = new _RecipeValueStoreProxyCalls(impl);
  }

  RecipeValueStoreProxy.fromHandle(core.MojoHandle handle) :
      impl = new RecipeValueStoreProxyImpl.fromHandle(handle) {
    ptr = new _RecipeValueStoreProxyCalls(impl);
  }

  RecipeValueStoreProxy.unbound() :
      impl = new RecipeValueStoreProxyImpl.unbound() {
    ptr = new _RecipeValueStoreProxyCalls(impl);
  }

  static RecipeValueStoreProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new RecipeValueStoreProxy.fromEndpoint(endpoint);

  Future close() => impl.close();

  String toString() {
    return "RecipeValueStoreProxy($impl)";
  }
}


class RecipeValueStoreStub extends bindings.Stub {
  RecipeValueStore _impl = null;

  RecipeValueStoreStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  RecipeValueStoreStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  RecipeValueStoreStub.unbound() : super.unbound();

  static RecipeValueStoreStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new RecipeValueStoreStub.fromEndpoint(endpoint);

  static const String name = RecipeValueStoreName;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_impl != null);
    switch (message.header.type) {
      case kRecipeValueStore_updateValues_name:
        var params = RecipeValueStoreUpdateValuesParams.deserialize(
            message.payload);
        _impl.updateValues(params.values);
        break;
      case kRecipeValueStore_setObserver_name:
        var params = RecipeValueStoreSetObserverParams.deserialize(
            message.payload);
        _impl.setObserver(params.observer);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  RecipeValueStore get impl => _impl;
      set impl(RecipeValueStore d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "RecipeValueStoreStub($superString)";
  }
}

const int kRecipeValueStoreObserver_onValuesChanged_name = 0;

const String RecipeValueStoreObserverName =
      'recipes::RecipeValueStoreObserver';

abstract class RecipeValueStoreObserver {
  void onValuesChanged(Map<String, RecipeChangeValue> changedValues);

}


class RecipeValueStoreObserverProxyImpl extends bindings.Proxy {
  RecipeValueStoreObserverProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  RecipeValueStoreObserverProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  RecipeValueStoreObserverProxyImpl.unbound() : super.unbound();

  static RecipeValueStoreObserverProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new RecipeValueStoreObserverProxyImpl.fromEndpoint(endpoint);

  String get name => RecipeValueStoreObserverName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }

  String toString() {
    var superString = super.toString();
    return "RecipeValueStoreObserverProxyImpl($superString)";
  }
}


class _RecipeValueStoreObserverProxyCalls implements RecipeValueStoreObserver {
  RecipeValueStoreObserverProxyImpl _proxyImpl;

  _RecipeValueStoreObserverProxyCalls(this._proxyImpl);
    void onValuesChanged(Map<String, RecipeChangeValue> changedValues) {
      assert(_proxyImpl.isBound);
      var params = new RecipeValueStoreObserverOnValuesChangedParams();
      params.changedValues = changedValues;
      _proxyImpl.sendMessage(params, kRecipeValueStoreObserver_onValuesChanged_name);
    }
  
}


class RecipeValueStoreObserverProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  RecipeValueStoreObserver ptr;
  final String name = RecipeValueStoreObserverName;

  RecipeValueStoreObserverProxy(RecipeValueStoreObserverProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _RecipeValueStoreObserverProxyCalls(proxyImpl);

  RecipeValueStoreObserverProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new RecipeValueStoreObserverProxyImpl.fromEndpoint(endpoint) {
    ptr = new _RecipeValueStoreObserverProxyCalls(impl);
  }

  RecipeValueStoreObserverProxy.fromHandle(core.MojoHandle handle) :
      impl = new RecipeValueStoreObserverProxyImpl.fromHandle(handle) {
    ptr = new _RecipeValueStoreObserverProxyCalls(impl);
  }

  RecipeValueStoreObserverProxy.unbound() :
      impl = new RecipeValueStoreObserverProxyImpl.unbound() {
    ptr = new _RecipeValueStoreObserverProxyCalls(impl);
  }

  static RecipeValueStoreObserverProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new RecipeValueStoreObserverProxy.fromEndpoint(endpoint);

  Future close() => impl.close();

  String toString() {
    return "RecipeValueStoreObserverProxy($impl)";
  }
}


class RecipeValueStoreObserverStub extends bindings.Stub {
  RecipeValueStoreObserver _impl = null;

  RecipeValueStoreObserverStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  RecipeValueStoreObserverStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  RecipeValueStoreObserverStub.unbound() : super.unbound();

  static RecipeValueStoreObserverStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new RecipeValueStoreObserverStub.fromEndpoint(endpoint);

  static const String name = RecipeValueStoreObserverName;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_impl != null);
    switch (message.header.type) {
      case kRecipeValueStoreObserver_onValuesChanged_name:
        var params = RecipeValueStoreObserverOnValuesChangedParams.deserialize(
            message.payload);
        _impl.onValuesChanged(params.changedValues);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  RecipeValueStoreObserver get impl => _impl;
      set impl(RecipeValueStoreObserver d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "RecipeValueStoreObserverStub($superString)";
  }
}


