using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using AdvertisingService.Dto;

namespace AdvertisingService.Services
{
	public class AdvertisingProvider : IAdvertisingProvider
	{
		private const string imageCatalog = "Images";
		private readonly string imageDirectory = AppDomain.CurrentDomain.BaseDirectory + imageCatalog + "\\";
		private readonly string[] extensions = new string[] { "*.gif", "*.png", "*.jpg", "*.jpeg" };

		public Advertising[] GetAdvertising(int quantity)
		{
			if (quantity < 1)
			{
				throw new ArgumentException("Quantity is not valid.");
			}

			Advertising[] advertising = new Advertising[quantity];
			Random rand = new Random();
			List<string> images = new List<string>();
			foreach (var ext in extensions)
			{
				var a = Directory.GetFiles(imageDirectory, ext);
				images.AddRange(Directory.GetFiles(imageDirectory, ext));
			}

			for (int i = 0; i < quantity; i++)
			{
				string imagePath = images[rand.Next(images.Count())];

				advertising[i] = new Advertising
				{
					ImageData = File.ReadAllBytes(imagePath),
					Extensions = Path.GetExtension(imagePath)
				};
			}

			return advertising;
		}
	}
}