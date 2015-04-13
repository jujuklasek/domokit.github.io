// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library intent_receiver.mojom;

import 'dart:async';

import 'package:mojo/public/dart/bindings.dart' as bindings;
import 'package:mojo/public/dart/core.dart' as core;


class IntentReceiverManagerRegisterReceiverParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Object receiver = null;

  IntentReceiverManagerRegisterReceiverParams() : super(kVersions.last.size);

  static IntentReceiverManagerRegisterReceiverParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static IntentReceiverManagerRegisterReceiverParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    IntentReceiverManagerRegisterReceiverParams result = new IntentReceiverManagerRegisterReceiverParams();

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
      
      result.receiver = decoder0.decodeServiceInterface(8, false, IntentReceiverProxy.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeInterface(receiver, 8, false);
  }

  String toString() {
    return "IntentReceiverManagerRegisterReceiverParams("
           "receiver: $receiver" ")";
  }
}

class IntentReceiverManagerRegisterReceiverResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  List<int> intent = null;

  IntentReceiverManagerRegisterReceiverResponseParams() : super(kVersions.last.size);

  static IntentReceiverManagerRegisterReceiverResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static IntentReceiverManagerRegisterReceiverResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    IntentReceiverManagerRegisterReceiverResponseParams result = new IntentReceiverManagerRegisterReceiverResponseParams();

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
      
      result.intent = decoder0.decodeUint8Array(8, bindings.kNothingNullable, bindings.kUnspecifiedArrayLength);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeUint8Array(intent, 8, bindings.kNothingNullable, bindings.kUnspecifiedArrayLength);
  }

  String toString() {
    return "IntentReceiverManagerRegisterReceiverResponseParams("
           "intent: $intent" ")";
  }
}

class IntentReceiverOnIntentParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  List<int> intent = null;

  IntentReceiverOnIntentParams() : super(kVersions.last.size);

  static IntentReceiverOnIntentParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static IntentReceiverOnIntentParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    IntentReceiverOnIntentParams result = new IntentReceiverOnIntentParams();

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
      
      result.intent = decoder0.decodeUint8Array(8, bindings.kNothingNullable, bindings.kUnspecifiedArrayLength);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeUint8Array(intent, 8, bindings.kNothingNullable, bindings.kUnspecifiedArrayLength);
  }

  String toString() {
    return "IntentReceiverOnIntentParams("
           "intent: $intent" ")";
  }
}
const int kIntentReceiverManager_registerReceiver_name = 0;

const String IntentReceiverManagerName =
      'intent_receiver::IntentReceiverManager';

abstract class IntentReceiverManager {
  Future<IntentReceiverManagerRegisterReceiverResponseParams> registerReceiver(Object receiver,[Function responseFactory = null]);

}


class IntentReceiverManagerProxyImpl extends bindings.Proxy {
  IntentReceiverManagerProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  IntentReceiverManagerProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  IntentReceiverManagerProxyImpl.unbound() : super.unbound();

  static IntentReceiverManagerProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new IntentReceiverManagerProxyImpl.fromEndpoint(endpoint);

  String get name => IntentReceiverManagerName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kIntentReceiverManager_registerReceiver_name:
        var r = IntentReceiverManagerRegisterReceiverResponseParams.deserialize(
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
    return "IntentReceiverManagerProxyImpl($superString)";
  }
}


class _IntentReceiverManagerProxyCalls implements IntentReceiverManager {
  IntentReceiverManagerProxyImpl _proxyImpl;

  _IntentReceiverManagerProxyCalls(this._proxyImpl);
    Future<IntentReceiverManagerRegisterReceiverResponseParams> registerReceiver(Object receiver,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new IntentReceiverManagerRegisterReceiverParams();
      params.receiver = receiver;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kIntentReceiverManager_registerReceiver_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
}


class IntentReceiverManagerProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  IntentReceiverManager ptr;
  final String name = IntentReceiverManagerName;

  IntentReceiverManagerProxy(IntentReceiverManagerProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _IntentReceiverManagerProxyCalls(proxyImpl);

  IntentReceiverManagerProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new IntentReceiverManagerProxyImpl.fromEndpoint(endpoint) {
    ptr = new _IntentReceiverManagerProxyCalls(impl);
  }

  IntentReceiverManagerProxy.fromHandle(core.MojoHandle handle) :
      impl = new IntentReceiverManagerProxyImpl.fromHandle(handle) {
    ptr = new _IntentReceiverManagerProxyCalls(impl);
  }

  IntentReceiverManagerProxy.unbound() :
      impl = new IntentReceiverManagerProxyImpl.unbound() {
    ptr = new _IntentReceiverManagerProxyCalls(impl);
  }

  static IntentReceiverManagerProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new IntentReceiverManagerProxy.fromEndpoint(endpoint);

  Future close({bool immediate: false}) => impl.close(immediate: immediate);

  String toString() {
    return "IntentReceiverManagerProxy($impl)";
  }
}


class IntentReceiverManagerStub extends bindings.Stub {
  IntentReceiverManager _impl = null;

  IntentReceiverManagerStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  IntentReceiverManagerStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  IntentReceiverManagerStub.unbound() : super.unbound();

  static IntentReceiverManagerStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new IntentReceiverManagerStub.fromEndpoint(endpoint);

  static const String name = IntentReceiverManagerName;


  IntentReceiverManagerRegisterReceiverResponseParams _IntentReceiverManagerRegisterReceiverResponseParamsFactory(List<int> intent) {
    var result = new IntentReceiverManagerRegisterReceiverResponseParams();
    result.intent = intent;
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_impl != null);
    switch (message.header.type) {
      case kIntentReceiverManager_registerReceiver_name:
        var params = IntentReceiverManagerRegisterReceiverParams.deserialize(
            message.payload);
        return _impl.registerReceiver(params.receiver,_IntentReceiverManagerRegisterReceiverResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kIntentReceiverManager_registerReceiver_name,
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

  IntentReceiverManager get impl => _impl;
      set impl(IntentReceiverManager d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "IntentReceiverManagerStub($superString)";
  }
}

const int kIntentReceiver_onIntent_name = 0;

const String IntentReceiverName =
      'intent_receiver::IntentReceiver';

abstract class IntentReceiver {
  void onIntent(List<int> intent);

}


class IntentReceiverProxyImpl extends bindings.Proxy {
  IntentReceiverProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  IntentReceiverProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  IntentReceiverProxyImpl.unbound() : super.unbound();

  static IntentReceiverProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new IntentReceiverProxyImpl.fromEndpoint(endpoint);

  String get name => IntentReceiverName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }

  String toString() {
    var superString = super.toString();
    return "IntentReceiverProxyImpl($superString)";
  }
}


class _IntentReceiverProxyCalls implements IntentReceiver {
  IntentReceiverProxyImpl _proxyImpl;

  _IntentReceiverProxyCalls(this._proxyImpl);
    void onIntent(List<int> intent) {
      assert(_proxyImpl.isBound);
      var params = new IntentReceiverOnIntentParams();
      params.intent = intent;
      _proxyImpl.sendMessage(params, kIntentReceiver_onIntent_name);
    }
  
}


class IntentReceiverProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  IntentReceiver ptr;
  final String name = IntentReceiverName;

  IntentReceiverProxy(IntentReceiverProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _IntentReceiverProxyCalls(proxyImpl);

  IntentReceiverProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new IntentReceiverProxyImpl.fromEndpoint(endpoint) {
    ptr = new _IntentReceiverProxyCalls(impl);
  }

  IntentReceiverProxy.fromHandle(core.MojoHandle handle) :
      impl = new IntentReceiverProxyImpl.fromHandle(handle) {
    ptr = new _IntentReceiverProxyCalls(impl);
  }

  IntentReceiverProxy.unbound() :
      impl = new IntentReceiverProxyImpl.unbound() {
    ptr = new _IntentReceiverProxyCalls(impl);
  }

  static IntentReceiverProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new IntentReceiverProxy.fromEndpoint(endpoint);

  Future close({bool immediate: false}) => impl.close(immediate: immediate);

  String toString() {
    return "IntentReceiverProxy($impl)";
  }
}


class IntentReceiverStub extends bindings.Stub {
  IntentReceiver _impl = null;

  IntentReceiverStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  IntentReceiverStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  IntentReceiverStub.unbound() : super.unbound();

  static IntentReceiverStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new IntentReceiverStub.fromEndpoint(endpoint);

  static const String name = IntentReceiverName;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_impl != null);
    switch (message.header.type) {
      case kIntentReceiver_onIntent_name:
        var params = IntentReceiverOnIntentParams.deserialize(
            message.payload);
        _impl.onIntent(params.intent);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  IntentReceiver get impl => _impl;
      set impl(IntentReceiver d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "IntentReceiverStub($superString)";
  }
}


