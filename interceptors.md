# Interceptors

Interceptors are a mechanism for monitoring calls. They are used to perform some actions before sending out a request, or after receiving a response. If you want to modify body of requests or responses we recommend you to use [Converters](https://hadrien-lejard.gitbook.io/chopper/converters/converters) instead. RequestInterceptor are called after Converter.convertRequest and ResponseInterceptors are called after Converter.convertResponse. To apply an interceptor add it to ChopperClient.

```text
final chopper = new ChopperClient(
   interceptors: [
     //put your interceptors here
   ]
);
```

You can use Builtin Interceptors or you can write your own.

## Builtin Interceptors

### HttpLoggingInterceptor

It's a useful tool for printing detailed information like url, headers, bytes and request method or response status code for every call. It uses [logging package](https://pub.dev/packages/logging) from Dart team and logs into debug console at INFO level.

## **Request**

Implement `RequestInterceptor` class or define function with following signature `FutureOr RequestInterceptorFunc(Request request)`

Request interceptor are called just before sending request

```text
final chopper = new ChopperClient(
   interceptors: [
     (request) async => request.copyWith(body: {}),
   ]
);
```

## **Response**

Implement `ResponseInterceptor` class or define function with following signature `FutureOr ResponseInterceptorFunc(Response response)`

{% hint style="info" %} Called after successful or failed request {% endhint %}

```text
final chopper = new ChopperClient(
   interceptors: [
     (response) async => response.copyWith(body: {}),
   ]
);
```

## Builtins

* [CurlInterceptor](https://pub.dev/documentation/chopper/latest/chopper/CurlInterceptor-class.html)
* [HttpLoggingInterceptor](https://pub.dev/documentation/chopper/latest/chopper/HttpLoggingInterceptor-class.html)

