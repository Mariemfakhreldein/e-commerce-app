<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--@elvariable id="user" type="gov.iti.jets.domain.models.User"--%>

<html lang="en" class="relative">

<head>
    <meta charset="UTF-8">
    <script src="<c:url value="/js/components/cookie.js"/>"></script>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<c:url value="/css/tailwind-out.css"/>">
    <title>Shop delicious treats | ChocoTown</title>
</head>

<body class="flex flex-col h-screen">

<%@include file="/WEB-INF/views/navbars/customerNav.jspf" %>

<section id="searchBar" class="mt-5 md:self-center md:w-9/12">
    <div class="flex ml-5">
        <div class="relative flex-grow">

            <div class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
                <!-- Heroicon name: solid/search -->
                <svg class="w-5 h-5 text-gray-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
                     fill="currentColor" aria-hidden="true">
                    <path fill-rule="evenodd"
                          d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z"
                          clip-rule="evenodd"></path>
                </svg>
            </div>


            <input id="searchInput"
                   class="block w-full py-2 pl-10 pr-3 text-sm placeholder-gray-500 bg-white border border-gray-300 rounded-md rounded-r-none focus:outline-none focus:text-gray-900 border-r-0 focus:placeholder-gray-400 focus:ring-1 focus:ring-gray-50 focus:border-gray-300 sm:text-sm"
                   placeholder="Search" type="search">
        </div>

        <!-- CATEGORY DROP DOWN -->
        <div class="relative inline-block w-32">
            <select id="categorySelect"
                    class="block w-full px-4 py-2 pr-8 leading-tight bg-white rounded-l-none border border-gray-300 rounded appearance-none focus:outline-none border-l-0 hover:border-gray-500 focus:ring-1 focus:ring-indigo-500 focus:border-indigo-500">
                <option selected>Category</option>
                <option>Chocolate</option>
                <option>Drinks</option>
            </select>
        </div>

        <%-- SEARCH BUTTON --%>
        <div class="relative inline-block w-14 mx-5">
            <button id="searchButton"
                    class="block w-full px-4 py-2 pr-8 leading-tight border bg-indigo-600 border-gray-300 rounded appearance-none focus:outline-none hover:bg-indigo-700 hover:border-gray-500 focus:ring-1 focus:ring-indigo-500 focus:border-indigo-500">
                <svg class="w-5 h-5 text-gray-50" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
                     fill="currentColor" aria-hidden="true">
                    <path fill-rule="evenodd"
                          d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z"
                          clip-rule="evenodd"></path>
                </svg>
            </button>
        </div>
    </div>
</section>


<!-- Category preview -->
<section id="categoryPreviews">

    <div class="bg-white">
        <div class="max-w-2xl px-4 py-16 mx-auto sm:py-24 sm:px-6 lg:max-w-7xl">
            <div class="relative overflow-hidden rounded-lg lg:h-96">
                <div class="absolute inset-0">
                    <img src="https://images.unsplash.com/photo-1542843137-8791a6904d14?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80"
                         alt="" class="object-cover object-center w-full h-full">
                </div>
                <div aria-hidden="true" class="relative w-full h-96 lg:hidden"></div>
                <div aria-hidden="true" class="relative w-full h-32 lg:hidden"></div>
                <div
                        class="absolute inset-x-0 bottom-0 p-6 bg-gray-800 bg-opacity-75 rounded-bl-lg rounded-br-lg backdrop-filter backdrop-blur sm:flex sm:items-center sm:justify-between lg:inset-y-0 lg:inset-x-auto lg:w-96 lg:rounded-tl-lg lg:rounded-br-none lg:flex-col lg:items-start">
                    <div>
                        <h2 class="text-xl font-bold text-white">Chocolate Collection</h2>
                        <p class="mt-1 text-sm text-gray-300">Discover our collection of precious chocolates.</p>
                    </div>
                    <a id="viewTheCollectionButton"
                       class="cursor-pointer flex items-center justify-center flex-shrink-0 px-4 py-3 mt-6 text-base font-medium text-white bg-white bg-opacity-0 border border-white border-opacity-25 rounded-md hover:bg-opacity-10 sm:mt-0 sm:ml-8 lg:ml-0 lg:w-full">View
                        the collection</a>
                </div>
            </div>
        </div>
    </div>


</section>


<!-- Products list -->

<section id="productsList">

    <div class="bg-white">
        <div class="max-w-2xl px-4 py-16 mx-auto sm:py-24 sm:px-6 lg:max-w-7xl lg:px-8">
            <h2 id="productsTitle" class="text-xl font-bold text-gray-900">Our products</h2>

            <div id="productsContainer"
                 class="grid grid-cols-1 mt-8 gap-y-12 sm:grid-cols-2 sm:gap-x-6 lg:grid-cols-4 xl:gap-x-8 ">

                <!-- PRODUCT CARD -->

                <%--                <div class="p-2 rounded-lg shadow-md cursor-pointer hover:shadow-xl">
                                    <a href="#bla">
                                        <div class="relative">
                                            <div class="relative w-full overflow-hidden rounded-lg h-72">
                                                <img src="https://m.media-amazon.com/images/I/61mSdXdf00S._AC_SL1500_.jpg"
                                                     alt="Chocolate image." class="object-scale-down object-center w-full h-full">
                                            </div>
                                            <div class="relative mt-4">
                                                <h3 class="text-sm font-medium text-gray-900">Snickers</h3>
                                                <p class="mt-1 text-sm text-gray-500">Caramel & peanuts</p>
                                            </div>
                                            <div
                                                    class="absolute inset-x-0 top-0 flex items-end justify-end p-4 overflow-hidden rounded-lg h-72">
                                                <div aria-hidden="true"
                                                     class="absolute inset-x-0 bottom-0 opacity-50 h-36 bg-gradient-to-t from-black">
                                                </div>
                                                <p class="relative text-lg font-semibold text-white">$140</p>
                                            </div>
                                        </div>
                                        <div class="mt-6">
                                            <a href="#"
                                               class="relative flex items-center justify-center px-8 py-2 text-sm font-medium text-gray-900 bg-gray-100 border border-transparent rounded-md hover:bg-gray-200">Add
                                                to bag<span class="sr-only">, Zip Tote Basket</span></a>
                                        </div>
                                    </a>
                                </div>--%>

                <!-- MORE PRODUCTS... -->
            </div>
        </div>
    </div>

    <!-- LOAD MORE BUTTON -->
    <div class="flex justify-center">
        <button id="loadMoreButton" type="button"
                class="inline-flex items-center px-4 py-2 mx-auto text-base font-medium text-white bg-indigo-600 border border-transparent rounded-md shadow-sm hover:bg-indigo-700 ">
            Load more
            <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5 ml-3 -mr-1" fill="none" viewBox="0 0 24 24"
                 stroke="currentColor" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round" d="M12 4v16m8-8H4"></path>
            </svg>
        </button>

        <!-- SPINNER -->
        <svg id="loadMoreSpinner" class="hidden w-32 m-auto " xmlns="http://www.w3.org/2000/svg"
             style="shape-rendering: auto;" viewBox="0 0 100 100"
             preserveAspectRatio="xMidYMid">
            <g transform="rotate(0 50 50)">
                <rect x="43" y="21" rx="5.44" ry="5.44" width="14" height="16" fill="#191d3a">
                    <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="0.6711409395973155s"
                             begin="-0.6101281269066504s" repeatCount="indefinite"></animate>
                </rect>
            </g>
            <g transform="rotate(32.72727272727273 50 50)">
                <rect x="43" y="21" rx="5.44" ry="5.44" width="14" height="16" fill="#93dbe9">
                    <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="0.6711409395973155s"
                             begin="-0.5491153142159854s" repeatCount="indefinite"></animate>
                </rect>
            </g>
            <g transform="rotate(65.45454545454545 50 50)">
                <rect x="43" y="21" rx="5.44" ry="5.44" width="14" height="16" fill="#689cc5">
                    <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="0.6711409395973155s"
                             begin="-0.4881025015253203s" repeatCount="indefinite"></animate>
                </rect>
            </g>
            <g transform="rotate(98.18181818181819 50 50)">
                <rect x="43" y="21" rx="5.44" ry="5.44" width="14" height="16" fill="#5e6fa3">
                    <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="0.6711409395973155s"
                             begin="-0.42708968883465526s" repeatCount="indefinite"></animate>
                </rect>
            </g>
            <g transform="rotate(130.9090909090909 50 50)">
                <rect x="43" y="21" rx="5.44" ry="5.44" width="14" height="16" fill="#3b4368">
                    <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="0.6711409395973155s"
                             begin="-0.3660768761439902s" repeatCount="indefinite"></animate>
                </rect>
            </g>
            <g transform="rotate(163.63636363636363 50 50)">
                <rect x="43" y="21" rx="5.44" ry="5.44" width="14" height="16" fill="#d9dbee">
                    <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="0.6711409395973155s"
                             begin="-0.3050640634533252s" repeatCount="indefinite"></animate>
                </rect>
            </g>
            <g transform="rotate(196.36363636363637 50 50)">
                <rect x="43" y="21" rx="5.44" ry="5.44" width="14" height="16" fill="#b3b7e2">
                    <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="0.6711409395973155s"
                             begin="-0.24405125076266015s" repeatCount="indefinite"></animate>
                </rect>
            </g>
            <g transform="rotate(229.0909090909091 50 50)">
                <rect x="43" y="21" rx="5.44" ry="5.44" width="14" height="16" fill="#191d3a">
                    <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="0.6711409395973155s"
                             begin="-0.1830384380719951s" repeatCount="indefinite"></animate>
                </rect>
            </g>
            <g transform="rotate(261.8181818181818 50 50)">
                <rect x="43" y="21" rx="5.44" ry="5.44" width="14" height="16" fill="#93dbe9">
                    <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="0.6711409395973155s"
                             begin="-0.12202562538133008s" repeatCount="indefinite"></animate>
                </rect>
            </g>
            <g transform="rotate(294.54545454545456 50 50)">
                <rect x="43" y="21" rx="5.44" ry="5.44" width="14" height="16" fill="#689cc5">
                    <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="0.6711409395973155s"
                             begin="-0.06101281269066504s" repeatCount="indefinite"></animate>
                </rect>
            </g>
            <g transform="rotate(327.27272727272725 50 50)">
                <rect x="43" y="21" rx="5.44" ry="5.44" width="14" height="16" fill="#5e6fa3">
                    <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="0.6711409395973155s"
                             begin="0s" repeatCount="indefinite"></animate>
                </rect>
            </g>
            <!-- [ldio] generated by https://loading.io/ -->
        </svg>


    </div>

</section>

<div class="fixed bottom-6 right-6 w-16">

    <a href="<c:url value="/contactUs"/>">
        <img src="/img/common/contact.png"/>

    </a>

</div>


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
<script src="<c:url value="/js/home/home.js"/>"></script>
</body>

</html>