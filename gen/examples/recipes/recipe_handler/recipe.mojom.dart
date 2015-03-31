// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library recipe.mojom;

import 'dart:async';

import 'package:mojo/public/dart/bindings.dart' as bindings;
import 'package:mojo/public/dart/core.dart' as core;


class Ingredient extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String url = null;

  Ingredient() : super(kVersions.last.size);

  static Ingredient deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static Ingredient decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    Ingredient result = new Ingredient();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size != kVersions[i].size)
            throw new bindings.MojoCodecError(
                'Header doesn\'t correspond to any known version.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      result.url = decoder0.decodeString(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(url, 8, false);
  }

  String toString() {
    return "Ingredient("
           "url: $url" ")";
  }
}

class RecipeGetIngredientsParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  RecipeGetIngredientsParams() : super(kVersions.last.size);

  static RecipeGetIngredientsParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static RecipeGetIngredientsParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    RecipeGetIngredientsParams result = new RecipeGetIngredientsParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size != kVersions[i].size)
            throw new bindings.MojoCodecError(
                'Header doesn\'t correspond to any known version.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    encoder.getStructEncoderAtOffset(kVersions.last);
  }

  String toString() {
    return "RecipeGetIngredientsParams("")";
  }
}

class RecipeGetIngredientsResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  List<Ingredient> ingredients = null;

  RecipeGetIngredientsResponseParams() : super(kVersions.last.size);

  static RecipeGetIngredientsResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static RecipeGetIngredientsResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    RecipeGetIngredientsResponseParams result = new RecipeGetIngredientsResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size != kVersions[i].size)
            throw new bindings.MojoCodecError(
                'Header doesn\'t correspond to any known version.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(8, false);
      {
        var si1 = decoder1.decodeDataHeaderForPointerArray(bindings.kUnspecifiedArrayLength);
        result.ingredients = new List<Ingredient>(si1.numElements);
        for (int i1 = 0; i1 < si1.numElements; ++i1) {
          
          var decoder2 = decoder1.decodePointer(bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i1, false);
          result.ingredients[i1] = Ingredient.decode(decoder2);
        }
      }
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    if (ingredients == null) {
      encoder0.encodeNullPointer(8, false);
    } else {
      var encoder1 = encoder0.encodePointerArray(ingredients.length, 8, bindings.kUnspecifiedArrayLength);
      for (int i0 = 0; i0 < ingredients.length; ++i0) {
        
        encoder1.encodeStruct(ingredients[i0], bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i0, false);
      }
    }
  }

  String toString() {
    return "RecipeGetIngredientsResponseParams("
           "ingredients: $ingredients" ")";
  }
}
const int kRecipe_getIngredients_name = 0;

const String RecipeName =
      'recipes::Recipe';

abstract class Recipe {
  Future<RecipeGetIngredientsResponseParams> getIngredients([Function responseFactory = null]);

}


class RecipeProxyImpl extends bindings.Proxy {
  RecipeProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  RecipeProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  RecipeProxyImpl.unbound() : super.unbound();

  static RecipeProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new RecipeProxyImpl.fromEndpoint(endpoint);

  String get name => RecipeName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kRecipe_getIngredients_name:
        var r = RecipeGetIngredientsResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          throw 'Message had unknown request Id: ${message.header.requestId}';
        }
        completerMap.remove(message.header.requestId);
        assert(!c.isCompleted);
        c.complete(r);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }

  String toString() {
    var superString = super.toString();
    return "RecipeProxyImpl($superString)";
  }
}


class _RecipeProxyCalls implements Recipe {
  RecipeProxyImpl _proxyImpl;

  _RecipeProxyCalls(this._proxyImpl);
    Future<RecipeGetIngredientsResponseParams> getIngredients([Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new RecipeGetIngredientsParams();
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kRecipe_getIngredients_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
}


class RecipeProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  Recipe ptr;
  final String name = RecipeName;

  RecipeProxy(RecipeProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _RecipeProxyCalls(proxyImpl);

  RecipeProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new RecipeProxyImpl.fromEndpoint(endpoint) {
    ptr = new _RecipeProxyCalls(impl);
  }

  RecipeProxy.fromHandle(core.MojoHandle handle) :
      impl = new RecipeProxyImpl.fromHandle(handle) {
    ptr = new _RecipeProxyCalls(impl);
  }

  RecipeProxy.unbound() :
      impl = new RecipeProxyImpl.unbound() {
    ptr = new _RecipeProxyCalls(impl);
  }

  static RecipeProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new RecipeProxy.fromEndpoint(endpoint);

  Future close({bool nodefer: false}) => impl.close(nodefer: nodefer);

  String toString() {
    return "RecipeProxy($impl)";
  }
}


class RecipeStub extends bindings.Stub {
  Recipe _impl = null;

  RecipeStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  RecipeStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  RecipeStub.unbound() : super.unbound();

  static RecipeStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new RecipeStub.fromEndpoint(endpoint);

  static const String name = RecipeName;


  RecipeGetIngredientsResponseParams _RecipeGetIngredientsResponseParamsFactory(List<Ingredient> ingredients) {
    var result = new RecipeGetIngredientsResponseParams();
    result.ingredients = ingredients;
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_impl != null);
    switch (message.header.type) {
      case kRecipe_getIngredients_name:
        var params = RecipeGetIngredientsParams.deserialize(
            message.payload);
        return _impl.getIngredients(_RecipeGetIngredientsResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kRecipe_getIngredients_name,
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

  Recipe get impl => _impl;
      set impl(Recipe d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "RecipeStub($superString)";
  }
}


