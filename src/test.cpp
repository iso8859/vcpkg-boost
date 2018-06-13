#include <SDKDDKVer.h>
#include <iostream>
#include <boost/system/config.hpp>
#include <boost/thread.hpp>
#include <boost/shared_ptr.hpp>
#include <boost/asio.hpp>
#include <boost/lexical_cast.hpp>

int main(int argc, char *argv[])
{
	boost::asio::io_service io_service;
    auto socket = boost::shared_ptr<boost::asio::ip::tcp::socket>(new boost::asio::ip::tcp::socket(io_service));
	std::cout << "ok" << std::endl;
}