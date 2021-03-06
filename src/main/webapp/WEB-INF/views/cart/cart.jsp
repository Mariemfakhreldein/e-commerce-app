<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--@elvariable id="shoppingCart" type="gov.iti.jets.domain.models.ShoppingCart"--%>
<%--@elvariable id="lineItem" type="gov.iti.jets.domain.models.CartLineItem"--%>
<%--@elvariable id="user" type="gov.iti.jets.domain.models.User"--%>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <script src="<c:url value="/js/components/cookie.js"/>"></script>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<c:url value="/css/tailwind-out.css"/>">
    <title>Shopping Cart | ChocoTown</title>
</head>

<body class="flex flex-col h-screen">
<%@include file="/WEB-INF/views/navbars/customerNav.jspf" %>

<section id="alertSection" class="z-20">
    <c:if test="${shoppingCartOutdated != null}">
        <div class="rounded-md bg-red-50 p-4">
            <div class="flex">
                <div class="flex-shrink-0">
                    <!-- Heroicon name: solid/x-circle -->
                    <svg class="h-5 w-5 text-red-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
                         fill="currentColor">
                        <path fill-rule="evenodd"
                              d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z"
                              clip-rule="evenodd"></path>
                    </svg>
                </div>
                <div class="ml-3">
                    <h3 class="text-sm font-medium text-red-800">One or more items are no longer are available or
                        their quantities were reduced. 📦</h3>
                </div>
            </div>
        </div>
    </c:if>
</section>


<%--Shoppingcart--%>

<section id="shoppingCart">
    <div class="bg-white">
        <div class="max-w-2xl px-4 pt-16 pb-24 mx-auto sm:px-6 lg:max-w-7xl lg:px-8">
            <h1 class="text-3xl font-extrabold tracking-tight text-gray-900 sm:text-4xl">
                <c:choose>
                    <c:when test="${empty shoppingCart.cartLineItemsUnmodifiable}">
                        Your shopping cart is empty... 🌵
                    </c:when>
                    <c:otherwise>
                        Shopping Cart 🛒
                    </c:otherwise>
                </c:choose>
            </h1>
            <form class="mt-12 lg:grid lg:grid-cols-12 lg:gap-x-12 lg:items-start xl:gap-x-16"
                  action="<c:url value="/cart"/>">
                <section aria-labelledby="cart-heading" class="lg:col-span-7">
                    <h2 id="cart-heading" class="sr-only">Items in your shopping cart</h2>

                    <ul role="list" id="cartProductsList"
                        class="border-t border-b border-gray-200 divide-y divide-gray-200">

                        <c:if test="${!empty shoppingCart}">

                            <c:forEach items="${shoppingCart.cartLineItemsUnmodifiable}" var="lineItem">

                                <li id="${lineItem.product.id}" class="flex py-6 sm:py-10">
                                    <div class="flex-shrink-0">
                                        <img src="${lineItem.product.imageName}"
                                             alt="Front of men&#039;s Basic Tee in sienna."
                                             class="object-cover object-scale-down w-24 h-24 rounded-md sm:w-48 sm:h-48">
                                    </div>

                                    <div class="flex flex-col justify-between flex-1 ml-4 sm:ml-6">
                                        <div class="relative pr-9 sm:grid sm:grid-cols-2 sm:gap-x-6 sm:pr-0">
                                            <div>
                                                <div class="flex justify-between">
                                                    <h3 class="text-sm">
                                                        <a href="#"
                                                           class="font-medium text-gray-700 hover:text-gray-800">
                                                                ${lineItem.product.name} </a>
                                                    </h3>
                                                </div>

                                                <p class="mt-1 text-sm font-medium text-gray-500">${lineItem.product.priceFormatted}</p>
                                            </div>

                                            <div class="mt-4 sm:mt-0 sm:pr-9">
                                                <input data-quantityId="${lineItem.product.id}" type="number"
                                                       name="quantity"
                                                       class="max-w-full w-16 rounded-md border border-gray-300 py-1.5 text-base leading-5 font-medium text-gray-700 text-left shadow-sm focus:outline-none focus:ring-1 focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm"
                                                       value="${lineItem.quantity}" min="1" max="10">

                                                <div class="absolute top-0 right-0">
                                                    <button data-productId="${lineItem.product.id}"
                                                            type="button"
                                                            class=" inline-flex p-2 -m-2 text-gray-400 hover:text-gray-500">
                                                        <!-- Heroicon name: solid/x -->
                                                        <svg data-productId="${lineItem.product.id}" class="w-5 h-5"
                                                             xmlns="http://www.w3.org/2000/svg"
                                                             viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                                            <path fill-rule="evenodd"
                                                                  d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                                                                  clip-rule="evenodd"></path>
                                                        </svg>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>


                                    </div>
                                </li>


                            </c:forEach>


                        </c:if>

                    </ul>
                </section>

                <!-- Order summary -->
                <section id="orderSummarySection" aria-labelledby="summary-heading"
                         class="<c:if test="${empty shoppingCart.cartLineItemsUnmodifiable}">hidden</c:if> px-4 py-6 mt-16 rounded-lg bg-gray-50 sm:p-6 lg:p-8 lg:mt-0 lg:col-span-5">
                    <h2 id="summary-heading" class="text-lg font-medium text-gray-900">Order summary</h2>

                    <dl class="mt-6 space-y-4">
                        <div class="flex items-center justify-between pt-4 border-t border-gray-200">
                            <dt class="text-base font-medium text-gray-600">Order total</dt>
                            <dd id="orderTotal" class="text-base font-medium text-gray-600">
                                EGP ${shoppingCart.totalFormatted}</dd>
                        </div>
                    </dl>

                    <!-- DISABLE this if cant buy -->
                    <div class="mt-6 w-full">
                        <%--                        --%>

                        <div id="checkoutButton"><a href="<c:url value="/checkout"/>"
                                                    class="text-center inline-block w-full px-4 py-3 text-base font-medium text-white bg-indigo-600 border border-transparent rounded-md shadow-sm hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-gray-50 focus:ring-indigo-500">
                            Checkout
                        </a>
                        </div>

                        <%--                        SPINNER--%>

                        <div class="relative flex justify-center px-4 py-2">
                            <svg id="checkoutSpinner"
                                 class="hidden w-8 "
                                 xmlns="http://www.w3.org/2000/svg"
                                 xmlns:xlink="http://www.w3.org/1999/xlink" style="shape-rendering: auto;"
                                 viewBox="0 0 100 100"
                                 preserveAspectRatio="xMidYMid">
                                <g transform="rotate(0 50 50)">
                                    <rect x="43" y="21" rx="5.44" ry="5.44" width="14" height="16" fill="#191d3a">
                                        <animate attributeName="opacity" values="1;0" keyTimes="0;1"
                                                 dur="0.6711409395973155s"
                                                 begin="-0.6101281269066504s" repeatCount="indefinite"></animate>
                                    </rect>
                                </g>
                                <g transform="rotate(32.72727272727273 50 50)">
                                    <rect x="43" y="21" rx="5.44" ry="5.44" width="14" height="16" fill="#93dbe9">
                                        <animate attributeName="opacity" values="1;0" keyTimes="0;1"
                                                 dur="0.6711409395973155s"
                                                 begin="-0.5491153142159854s" repeatCount="indefinite"></animate>
                                    </rect>
                                </g>
                                <g transform="rotate(65.45454545454545 50 50)">
                                    <rect x="43" y="21" rx="5.44" ry="5.44" width="14" height="16" fill="#689cc5">
                                        <animate attributeName="opacity" values="1;0" keyTimes="0;1"
                                                 dur="0.6711409395973155s"
                                                 begin="-0.4881025015253203s" repeatCount="indefinite"></animate>
                                    </rect>
                                </g>
                                <g transform="rotate(98.18181818181819 50 50)">
                                    <rect x="43" y="21" rx="5.44" ry="5.44" width="14" height="16" fill="#5e6fa3">
                                        <animate attributeName="opacity" values="1;0" keyTimes="0;1"
                                                 dur="0.6711409395973155s"
                                                 begin="-0.42708968883465526s" repeatCount="indefinite"></animate>
                                    </rect>
                                </g>
                                <g transform="rotate(130.9090909090909 50 50)">
                                    <rect x="43" y="21" rx="5.44" ry="5.44" width="14" height="16" fill="#3b4368">
                                        <animate attributeName="opacity" values="1;0" keyTimes="0;1"
                                                 dur="0.6711409395973155s"
                                                 begin="-0.3660768761439902s" repeatCount="indefinite"></animate>
                                    </rect>
                                </g>
                                <g transform="rotate(163.63636363636363 50 50)">
                                    <rect x="43" y="21" rx="5.44" ry="5.44" width="14" height="16" fill="#d9dbee">
                                        <animate attributeName="opacity" values="1;0" keyTimes="0;1"
                                                 dur="0.6711409395973155s"
                                                 begin="-0.3050640634533252s" repeatCount="indefinite"></animate>
                                    </rect>
                                </g>
                                <g transform="rotate(196.36363636363637 50 50)">
                                    <rect x="43" y="21" rx="5.44" ry="5.44" width="14" height="16" fill="#b3b7e2">
                                        <animate attributeName="opacity" values="1;0" keyTimes="0;1"
                                                 dur="0.6711409395973155s"
                                                 begin="-0.24405125076266015s" repeatCount="indefinite"></animate>
                                    </rect>
                                </g>
                                <g transform="rotate(229.0909090909091 50 50)">
                                    <rect x="43" y="21" rx="5.44" ry="5.44" width="14" height="16" fill="#191d3a">
                                        <animate attributeName="opacity" values="1;0" keyTimes="0;1"
                                                 dur="0.6711409395973155s"
                                                 begin="-0.1830384380719951s" repeatCount="indefinite"></animate>
                                    </rect>
                                </g>
                                <g transform="rotate(261.8181818181818 50 50)">
                                    <rect x="43" y="21" rx="5.44" ry="5.44" width="14" height="16" fill="#93dbe9">
                                        <animate attributeName="opacity" values="1;0" keyTimes="0;1"
                                                 dur="0.6711409395973155s"
                                                 begin="-0.12202562538133008s" repeatCount="indefinite"></animate>
                                    </rect>
                                </g>
                                <g transform="rotate(294.54545454545456 50 50)">
                                    <rect x="43" y="21" rx="5.44" ry="5.44" width="14" height="16" fill="#689cc5">
                                        <animate attributeName="opacity" values="1;0" keyTimes="0;1"
                                                 dur="0.6711409395973155s"
                                                 begin="-0.06101281269066504s" repeatCount="indefinite"></animate>
                                    </rect>
                                </g>
                                <g transform="rotate(327.27272727272725 50 50)">
                                    <rect x="43" y="21" rx="5.44" ry="5.44" width="14" height="16" fill="#5e6fa3">
                                        <animate attributeName="opacity" values="1;0" keyTimes="0;1"
                                                 dur="0.6711409395973155s"
                                                 begin="0s" repeatCount="indefinite"></animate>
                                    </rect>
                                </g>
                                <!-- [ldio] generated by https://loading.io/ -->
                            </svg>
                        </div>


                    </div>
                </section>
            </form>
        </div>
    </div>
</section>


<!-- FOOTER -->

<section class="mt-auto" id="footer">
    <footer class="bg-white">
        <div class="px-4 py-12 mx-auto max-w-7xl sm:px-6 md:flex md:items-center md:justify-between lg:px-8">
            <div class="flex justify-center space-x-6 md:order-2">
                <a href="https://github.com/MahmoudFawzyKhalil/e-commerce-app"
                   class="text-gray-400 hover:text-gray-500">
                    <span class="sr-only">GitHub</span>
                    <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
                        <path fill-rule="evenodd"
                              d="M12 2C6.477 2 2 6.484 2 12.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.608.069-.608 1.003.07 1.531 1.032 1.531 1.032.892 1.53 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0112 6.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.202 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.943.359.309.678.92.678 1.855 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0022 12.017C22 6.484 17.522 2 12 2z"
                              clip-rule="evenodd"></path>
                    </svg>
                </a>
            </div>
            <div class="mt-8 md:mt-0 md:order-1">
                <p class="text-base text-center text-gray-400">&copy; 2022 ITI, JETS. All rights reserved.</p>
            </div>
        </div>
    </footer>
</section>
<script src="<c:url value="/js/components/navbar.js"/>"></script>
<script src="<c:url value="/js/cart/cart.js"/>"></script>
</body>

</html>